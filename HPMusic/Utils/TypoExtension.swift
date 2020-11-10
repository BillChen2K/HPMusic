//
//  TypoExtension.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/11/10.
//

import Foundation
import SwiftUI
import UIKit

extension View {
    func HPFontH3() -> some View {
        return self.font(.system(size: 20, weight: .bold, design: .default)).padding(Edge.Set.vertical, 6).foregroundColor(Color("HPBlue"))
    }
    
    func HPFontP() -> some View {
       
        return self.padding(Edge.Set.vertical, 6).foregroundColor(Color(hex: 0x3e3e3e)).lineSpacing(8.0)
    }
}
