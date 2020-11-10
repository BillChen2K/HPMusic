//
//  CourseCompletion.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/11/10.
//

import SwiftUI

struct CourseCompletion: View {
    
    var finishedCourse: CourseModel
    
    @Binding var rootIsActive: Bool
    
    
    @State var selectedHardness = 1
    @State var commentText = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Image(systemName: "checkmark.seal").font(.system(size: 72, weight: .regular, design: .default)).foregroundColor(Color("HPBlueLight")).padding()
            }
           
            Text("恭喜你，完成课程").padding()
            Text(finishedCourse.courseName).font(.title)
            
            // 难度评价
            
            VStack() {
                Text("感觉难度怎么样？").font(.callout).foregroundColor(.secondary).padding()
                HStack {
                    
                    VStack {
                        Image("HPRatingEasy").padding()
                            .rotationEffect(.degrees(selectedHardness == 0 ? 15 : 0))
                            .scaleEffect(CGSize(width: selectedHardness == 0 ? 1.3 : 1, height: selectedHardness == 0 ? 1.3 : 1))
                            .opacity(selectedHardness == 0 ? 1 : 0.2)
                            .HPAnimation(duration: 0.6)
                        Text("太简单了")
                    }.padding(.horizontal)
                    .onTapGesture {
                        selectedHardness = 0
                    }
                    
                    VStack {
                        Image("HPRatingNormal").padding()
                            .rotationEffect(.degrees(selectedHardness == 1 ? 15 : 0))
                            .scaleEffect(CGSize(width: selectedHardness == 1 ? 1.3 : 1, height: selectedHardness == 1 ? 1.3 : 1))
                            .opacity(selectedHardness == 1 ? 1 : 0.2)
                            .HPAnimation(duration: 0.6)
                        Text("刚好")
                    }.padding(.horizontal)
                    .onTapGesture {
                        selectedHardness = 1
                    }
                    
                    VStack {
                        Image("HPRatingHard").padding()
                            .rotationEffect(.degrees(selectedHardness == 2 ? 15 : 0))
                            .scaleEffect(CGSize(width: selectedHardness == 2 ? 1.3 : 1, height: selectedHardness == 2 ? 1.3 : 1))
                            .opacity(selectedHardness == 2 ? 1 : 0.2)
                            .HPAnimation(duration: 0.6)
                        Text("太难了")
                    }.padding(.horizontal)
                    .onTapGesture {
                        selectedHardness = 2
                    }

                }
            }
            Spacer()
            // 评论
            
            VStack {
                
                Text("对课程有评论？").font(.callout).foregroundColor(.secondary).padding()
                TextEditor(text: $commentText).lineSpacing(5)
                    .padding(.all, 6)
                    .font(.body)
                    .overlay(RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.gray, lineWidth: 1))
            
            }.padding()

            Button(action: {
                self.rootIsActive = false
            }, label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 100).foregroundColor(Color("HPBlue")).frame(height: 48)
                    Text("完成").foregroundColor(.white).font(.title3)
                }
            }).padding(.all, 30).padding(.bottom, 30)
                   
          
            
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct CourseCompletion_Previews: PreviewProvider {
    static let demo = DemoCourseController()
    
    static var previews: some View {
        CourseCompletion(finishedCourse: demo.getPIANO001(), rootIsActive: .constant(false))
    }
}
