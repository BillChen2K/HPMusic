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
    @State private var globalLoading = false
    
    var body: some View {
        ZStack{
            TabView(selection: $selectedTab) {
                
                CommunityView()
                    .HPTabItem(icon_prefix: "community", title: "社区", tag: 1, select: $selectedTab)
           
                PersonalizeView()
                    .HPTabItem(icon_prefix: "personalize", title: "个性化", tag: 2, select: $selectedTab)
                PracticeView()
                    .HPTabItem(icon_prefix: "practice", title: "练习", tag: 3, select: $selectedTab)
                
                CourseView()
                    .HPTabItem(icon_prefix: "course", title: "课程", tag: 4, select: $selectedTab)
                
                MyView()
                    .HPTabItem(icon_prefix: "my", title: "我的", tag: 5, select: $selectedTab)
            }
            .font(.headline)
            .accentColor(Color("HPBlue"))
            .onAppear(){
                UITabBar.appearance().barTintColor = .white
     
            }
            
            if(globalLoading) {
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color("HPBlue"), Color("HPBlue")]), startPoint: .top, endPoint: .bottom)
                        .cornerRadius(6)
                        .opacity(0.9)
                    VStack{
                        HPLoader(strokeColor: Color.white, size: .Small)
                        TextNSL("加载中").foregroundColor(Color.white)
                            .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }

                    
                }
                
                .frame(width: 200, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .transition(AnyTransition.scale.combined(with: .opacity))
                .animation(.easeIn)
            }
            
//            VStack{
//                Button("Toggle Load", action: {
//                    withAnimation() {
//                        self.globalLoading.toggle()
//                    }
//                    
//                })
//                Spacer()
//            }

           
        }
       
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
    }
}

extension View  {
    func HPTabItem(icon_prefix: String, title: String, tag: Int, select: Binding<Int>) -> some View {
        return self
            .tabItem {
                if (select.wrappedValue == tag) {
                    Image("\(icon_prefix)_selected")
                }
                else{
                    Image("\(icon_prefix)_default")

                }
                Text(title)
            }
            .tag(tag)
    }
}
