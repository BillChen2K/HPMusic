// Custom Tab View
//
// Source: https://stackoverflow.com/questions/61827496/swiftui-how-to-animate-a-tabview-selection

import Foundation
import SwiftUI
import UIKit

typealias TabItem = (tag: Int, tab: AnyView)

class Model: ObservableObject {
    @Published var landscape: Bool = false

    init(isLandscape: Bool) {
        self.landscape = isLandscape // Initial value
        NotificationCenter.default.addObserver(self, selector: #selector(onViewWillTransition(notification:)), name: .my_onViewWillTransition, object: nil)
    }

    @objc func onViewWillTransition(notification: Notification) {
        guard let size = notification.userInfo?["size"] as? CGSize else { return }

        landscape = size.width > size.height
    }
}

extension Notification.Name {
    static let my_onViewWillTransition = Notification.Name("CustomUIHostingController_viewWillTransition")
}

class CustomUIHostingController<Content> : UIHostingController<Content> where Content : View {
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        NotificationCenter.default.post(name: .my_onViewWillTransition, object: nil, userInfo: ["size": size])
        super.viewWillTransition(to: size, with: coordinator)
    }
}

struct CustomTabView<Content>: View where Content: View {

    @State private var currentIndex: Int = 0
    @EnvironmentObject private var model: Model

    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {

        GeometryReader { geometry in
            return ZStack {
                // pages
                // onAppear on all pages are called only on initial load
                self.pagesInHStack(screenGeometry: geometry)
            }
            .overlayPreferenceValue(CustomTabItemPreferenceKey.self) { preferences in
                // tab bar
                return self.createTabBar(screenGeometry: geometry, tabItems: preferences.map {TabItem(tag: $0.tag, tab: $0.item)})
            }
        }
    }

    func getTabBarHeight(screenGeometry: GeometryProxy) -> CGFloat {
        // https://medium.com/@hacknicity/ipad-navigation-bar-and-toolbar-height-changes-in-ios-12-91c5766809f4
        // ipad 50
        // iphone && portrait 49
        // iphone && portrait && bottom safety 83
        // iphone && landscape 32
        // iphone && landscape && bottom safety 53
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 50 + screenGeometry.safeAreaInsets.bottom
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            if !model.landscape {
                return 49 + screenGeometry.safeAreaInsets.bottom
            } else {
                return 32 + screenGeometry.safeAreaInsets.bottom
            }
        }
        return 50
    }

    func pagesInHStack(screenGeometry: GeometryProxy) -> some View {

        let tabBarHeight = getTabBarHeight(screenGeometry: screenGeometry)
        let heightCut = tabBarHeight - screenGeometry.safeAreaInsets.bottom
        let spacing: CGFloat = 100 // so pages don't overlap (in case of leading and trailing safetyInset), arbitrary

        return HStack(spacing: spacing) {
            self.content()
                // reduced height, so items don't appear under tha tab bar
                .frame(width: screenGeometry.size.width, height: screenGeometry.size.height - heightCut)
                // move up to cover the reduced height
                // 0.1 for iPhone X's nav bar color to extend to status bar
                .offset(y: -heightCut/2 - 0.1)
        }
        .frame(width: screenGeometry.size.width, height: screenGeometry.size.height, alignment: .leading)
        .offset(x: -CGFloat(self.currentIndex) * screenGeometry.size.width + -CGFloat(self.currentIndex) * spacing)
    }

    func createTabBar(screenGeometry: GeometryProxy, tabItems: [TabItem]) -> some View {

        let height = getTabBarHeight(screenGeometry: screenGeometry)

        return VStack {
            Spacer()
            HStack(spacing: screenGeometry.size.width / (CGFloat(tabItems.count + 1) + 0.5)) {
                Spacer()
                ForEach(0..<tabItems.count, id: \.self) { i in
                    Group {
                        Button(action: {
                            self.currentIndex = i
                        }) {
                            tabItems[i].tab
                        }.foregroundColor(self.currentIndex == i ? .blue : .gray)
                    }
                }
                Spacer()
            }
            // move up from bottom safety inset
            .padding(.bottom, screenGeometry.safeAreaInsets.bottom > 0 ? screenGeometry.safeAreaInsets.bottom - 5 : 0 )
            .frame(width: screenGeometry.size.width, height: height)
            .background(
                self.getTabBarBackground(screenGeometry: screenGeometry)
            )
        }
        // move down to cover bottom of new iphones and ipads
        .offset(y: screenGeometry.safeAreaInsets.bottom)
    }

    func getTabBarBackground(screenGeometry: GeometryProxy) -> some View {

        return GeometryReader { tabBarGeometry in
            self.getBackgrounRectangle(tabBarGeometry: tabBarGeometry)
        }
    }

    func getBackgrounRectangle(tabBarGeometry: GeometryProxy) -> some View {

        return VStack {
            Rectangle()
                .fill(Color.white)
                .opacity(0.8)
                // border top
                // https://www.reddit.com/r/SwiftUI/comments/dehx9t/how_to_add_border_only_to_bottom/
                .padding(.top, 0.2)
                .background(Color.gray)

                .edgesIgnoringSafeArea([.leading, .trailing])
        }
    }
}

// MARK: - Tab Item Preference
struct CustomTabItemPreferenceData: Equatable {
    var tag: Int
    let item: AnyView
    let stringDescribing: String // to let preference know when the tab item is changed
    var badgeNumber: Int // to let preference know when the badgeNumber is changed


    static func == (lhs: CustomTabItemPreferenceData, rhs: CustomTabItemPreferenceData) -> Bool {
        lhs.tag == rhs.tag && lhs.stringDescribing == rhs.stringDescribing && lhs.badgeNumber == rhs.badgeNumber
    }
}

struct CustomTabItemPreferenceKey: PreferenceKey {

    typealias Value = [CustomTabItemPreferenceData]

    static var defaultValue: [CustomTabItemPreferenceData] = []

    static func reduce(value: inout [CustomTabItemPreferenceData], nextValue: () -> [CustomTabItemPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}

// TabItem
extension View {
    func customTabItem<Content>(@ViewBuilder content: @escaping () -> Content) -> some View where Content: View {
        self.preference(key: CustomTabItemPreferenceKey.self, value: [
            CustomTabItemPreferenceData(tag: 0, item: AnyView(content()), stringDescribing: String(describing: content()), badgeNumber: 0)
        ])
    }
}

// Tag
extension View {
    func customTag(_ tag: Int, badgeNumber: Int = 0) -> some View {

        self.transformPreference(CustomTabItemPreferenceKey.self) { (value: inout [CustomTabItemPreferenceData]) in

            guard value.count > 0 else { return }
            value[0].tag = tag
            value[0].badgeNumber = badgeNumber

        }
        .transformPreference(CustomTabItemPreferenceKey.self) { (value: inout [CustomTabItemPreferenceData]) -> Void in

            guard value.count > 0 else { return }
            value[0].tag = tag
            value[0].badgeNumber = badgeNumber
        }
        .tag(tag)
    }
}
