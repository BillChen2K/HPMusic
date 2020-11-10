//
//  PracticePlayView.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/11/9.
//
import Foundation
import SwiftUI

struct PracticePlayView: View {
    
    @State private var practicedTime = "72 小时 12 分钟"
    
    var body: some View {
        
        

            ScrollView {
                
                HPInfoCard {
                  
                    NavigationLink(destination: PracticeStatisticsView()) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("音乐之路，一步一脚印").font(.caption).foregroundColor(.gray)
                                Text("已累计练习 \(practicedTime)").font(.system(size: 22, weight: .bold, design: .default)).padding(.top, 6)
                            }.padding(.all, 24)
                            
                            Spacer()
                            
                            
                            Image(systemName: "chevron.right").padding().foregroundColor(.gray)

                        }
                    }
                    
                }
                
                // 为你推荐
                HPInfoCard {
                    VStack {
                        HStack {
                            Text("为你推荐").font(.body).fontWeight(.bold)
                            Spacer()
                        }

                        // 热点图
                        Image("imgDemoPiano2").resizable().aspectRatio(contentMode: .fill).frame(height:160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(6)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Spacer()
                            }
                            Text("征服大调音阶 —— D").font(.title2)
                            Text("点击查看前期知识准备").padding(.top, 6).font(.body).foregroundColor(.gray)
                        }
                        
                    }.padding(.all, 24)

                }
                
                
                // 为你推荐的训练
                HPInfoCard {
                    VStack {
                        HStack {
                            Text("为你推荐的训练").font(.body).fontWeight(.bold)
                            Spacer()
                            Image(systemName: "arrow.2.circlepath").font(.system(size: 15, weight: .bold, design: .default))
                            Text("换个课程".localized).font(.system(size: 15, weight: .regular, design: .rounded))
                        }.padding(.bottom, 12)
                        
                        NavigationLink(destination: CourseDescription()) {
                            ZStack {
                                // 背景图
                                Image("imgDemoPiano1").resizable().aspectRatio(contentMode: .fill).frame(height:220, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(6)
                                VStack {
                                    Spacer()
                                    HStack {
                                        Text("断奏、连奏这样练习\n让你的音乐有“温度”").font(.title2).foregroundColor(.white)
                                        Spacer()
                                    }
                                }.padding()
                                
                            }
                        }

                        

                        VStack(alignment: .leading) {
                            HStack {
                                Spacer()
                            }
                            Text("车尔尼599第20首，适合钢琴小白或有一定钢琴基础的人群。掌握断奏、连奏的技巧；左右手协调配合合奏出旋律。").padding(.top, 6).font(.body).lineSpacing(8)
                        }
                        
                    }.padding(.all, 24)
                    
                    
                    // 占位符
                   
                }
                
            }
            .background(Color(hex: 0xEFEFEF))

        
    
    }
    

    
}

struct PracticePlayView_Previews: PreviewProvider {
    static var previews: some View {
        PracticePlayView()
    }
}

struct HPInfoCard<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content:() -> Content) {
        self.content = content()
    }
    
    var body: some View {

            VStack(alignment: .leading) {
                self.content
            }
            .background(Color(.white))
            .font(.headline)


    }
}
