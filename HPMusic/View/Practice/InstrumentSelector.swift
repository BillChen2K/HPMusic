//
//  InstrumentSelector.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/11/9.
//

import SwiftUI

struct InstrumentSelector: View {
    
    @Binding var selectedInstrument: String
    
    @State var animationStatus = 0
    
    var availableInstruments: [String] = ["钢琴", "吉他", "声乐","架子鼓","尤克里里","贝斯", "乐理", "编曲"]
    
    var body: some View {
        
        ZStack {
            Rectangle().foregroundColor(Color(hex: 0xfafafa)).shadow(color: .gray, radius: 120, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()
                HStack(alignment: .bottom) {
                    
                    Text("选择乐器").font(.title)
                    Spacer()
                    Image(systemName: "guitars").opacity(0.3).font(.system(size: 72, weight: .regular, design: .default)).padding(.horizontal)
                }
                HStack {
                    ForEach(availableInstruments[0..<4], id: \.self) { one in
                        HPInstrumentTag(text: one, selected: $selectedInstrument)
                        Spacer()
                    }
                }.padding(.vertical, 12)
                HStack {
                    ForEach(availableInstruments[4..<8], id: \.self) { one in
                        HPInstrumentTag(text: one, selected: $selectedInstrument)
                        Spacer()
                    }
                }.padding(.bottom, 12)
                
                Text("点击下方区域退出选择").font(.callout).foregroundColor(.secondary).padding(6)
            }.padding().padding(.top, 48)
               

 
            
        }.frame(height: 320)
        .onAppear(perform: {
            animationStatus = 1
        })
        
        
    }
}

struct InstrumentSelector_Previews: PreviewProvider {
    static var previews: some View {
        InstrumentSelector(selectedInstrument: .constant("钢琴"))
    }
}

struct HPInstrumentTag: View {
    
    var text = ""
    @Binding var selected: String
    
    var body: some View {
        Button(action: {
            self.selected = text
        }) {
            if selected == text {
                VStack {
                    Text(text).font(.callout).foregroundColor(.white)
                        .fontWeight(.heavy).padding(.all, 9).padding(.horizontal, 8)
                    
                }.background(LinearGradient(gradient: Gradient(colors: [Color("HPBlueDark"), Color("HPBlueLight")]), startPoint: .topLeading, endPoint: .bottomTrailing)).padding(.horizontal, 3)
                
            }
            else {
                VStack {
                    Text(text).font(.callout).padding(.all, 9).padding(.horizontal, 8).foregroundColor(.primary)
               }.background(Color(hex: 0xcfcfcf)).padding(.horizontal, 3)
            }
            
        }
    }
}
