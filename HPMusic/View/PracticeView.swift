//
//  Practice.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/10/16.
//
// 练习 Tab

import SwiftUI

struct PracticeView: View {
    
    
    @State var selectedInstrument: String = "钢琴"
    @State private var selectedSubTab = 1
    @State private var showInstrumentSelector = false
    private var availableInstruments: [String] = ["钢琴", "吉他", "声乐", "钢琴","架子鼓","乐理", "尤克里里","贝斯"]
    private var subTabOffsets: [CGFloat] = [5, 90, 172, 226]
    
    var body: some View {
        
        NavigationView{
            ZStack {
                VStack (alignment: .leading ){
                    // Header Section
                    HStack{
                        Text(selectedInstrument.localized)
                            .font(.title).fontWeight(.bold)
                        
                        HStack{
                            Image(systemName: "arrow.2.circlepath").font(.system(size: 15, weight: .bold, design: .default))
                            Text("换乐器".localized).font(.system(size: 15, weight: .regular, design: .rounded))
                        }.foregroundColor(.gray)
                        .padding(.leading, 12).padding(.vertical, 6)
                        .onTapGesture(perform: {
                            withAnimation {
                                showInstrumentSelector.toggle()
                                
                            }
                        })
                        Spacer()
                        
                        Image(systemName: "magnifyingglass").font(.system(size: 24))
                    }.padding(.all, 16)
                    
                    // Sub tab bar
                    ZStack {
                        
                        // Split line
                        Rectangle().frame( height: 1, alignment: .center).foregroundColor(.white)
                            .shadow(color: .black, radius: 5, x: 0.0, y: 16)
                        
                        HStack(spacing: 0) {
                            VStack(alignment: .leading, spacing: 0) {
                                HStack{
                                    
                                    Text("Play").font(.system(size: 14, weight: .bold, design: .default))
                                        .padding(.trailing, 10).onTapGesture(perform: {
                                            selectedSubTab = 1
                                        })
                                    
                                    
                                    LinearGradient(gradient: Gradient(colors: [Color("HPBlueDark"), Color("HPBlueLight")]), startPoint: .leading, endPoint: .trailing).mask(Text("我的技能口袋").font(.system(size: 14, weight: .bold, design: .default)).scaledToFill())
                                        .padding(.trailing, 10)
                                        .frame(width: 100, height: 18)
                                        .onTapGesture(perform: {
                                            selectedSubTab = 2
                                        })
                                    
                                    Text("练动作").font(.system(size: 14, weight: .bold, design: .default))
                                        .padding(.trailing, 10)
                                        .onTapGesture(perform: {
                                            selectedSubTab = 3
                                        })
                                    
                                    Text("曲库").font(.system(size: 14, weight: .bold, design: .default))
                                        .padding(.trailing, 10)
                                        .onTapGesture(perform: {
                                            selectedSubTab = 4
                                        })
                                    
                                    
                                    Spacer()
                                    
                                    Image(systemName: "cube.fill").foregroundColor(Color(hex: 0x666666))
                                }
                                
                                Rectangle().frame(width: 24, height: 2, alignment: .leading).padding(.vertical, 6)
                                    .foregroundColor( Color("HPBlueDark")).offset(CGSize(width: subTabOffsets[selectedSubTab - 1], height: 0))
                                    .HPAnimation(duration: 0.35)
                            }
                            Spacer()
                        }.padding(.leading, 16).padding(.vertical, 0).padding(.trailing, 8)
                        .background(Color(.white))
                    }
                    
                    
                    // Main Content
                    
                    TabView(selection: $selectedSubTab) {
                        PracticePlayView()
                            .tag(1)
                        PracticeSkillPocketView()
                            .tag(2)
                        PracticeMovementView()
                            .tag(3)
                        PracticeSongLibraryView()
                            .tag(4)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .navigationBarHidden(true)
                    
                    
                    
                }
                
                
                ZStack {
                    if showInstrumentSelector {
                        Rectangle().foregroundColor(Color("HPBlueDark")).opacity(0.9)
                            .animation(.easeIn(duration: 1.5))
                            .onTapGesture {
                                withAnimation {
                                    showInstrumentSelector.toggle()
                                    
                                }
                        }
                    }
                    
                    if showInstrumentSelector {
                        VStack {
                            InstrumentSelector(selectedInstrument: $selectedInstrument)
                            Spacer()
                        }.transition(AnyTransition.offset(x: 0, y: -80).combined(with: AnyTransition.opacity))
                        .HPAnimation(duration: 0.6)
                    }
                    
                    
                }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
            }
            
            
            .navigationBarHidden(true)
            
        }.navigationViewStyle(StackNavigationViewStyle())
        
        
        
    }
}

struct PracticeView_Previews: PreviewProvider {
    
    static var previews: some View {
        PracticeView()
            .previewDevice("iPhone 11")
    }
}
