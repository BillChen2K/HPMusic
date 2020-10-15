//
//  ContentView.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/10/15.
//

import SwiftUI
import CoreData


struct ContentView: View {
    
    @State private var selectedTab = 3
    @State private var loading = false
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            CommunityView()
                .tabItem {
                    if(selectedTab == 1) {
                        Image("SplashIcon")
                            .resizable()
                            .frame(width: 32, height: 32, alignment: .center)
                        TextNSL("社区")
                    }
                    else{
                        Image(systemName: "1.square.fill")
                        TextNSL("社区")
                    }
                }
                .tag(1)
            SearchView()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    TextNSL("搜索")
                }
                .tag(2)
            
            PracticeView()
                .tabItem {
                    Image(systemName: "3.square.fill")
                    TextNSL("练习")
                }
                .tag(3)
            
            CourseView()
                .tabItem {
                    Image(systemName: "4.square.fill")
                    TextNSL("课程")
                }
                .tag(4)
            
            MyView()
                .tabItem {
                    Image(systemName: "5.square.fill")
                    TextNSL("我的")
                }
                .tag(5)
        }
        .font(.headline)
        .animation(.easeInOut)
        .transition(.opacity)
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
    }
}
