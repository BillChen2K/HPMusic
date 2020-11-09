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
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        TextNSL("社区")
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
