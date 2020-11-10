//
//  HPAnimation.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/11/9.
//

import Foundation
import SwiftUI

extension View {
    func HPAnimation(duration: Double, delay: Double = 0) -> some View {
        self.animation(Animation.timingCurve(0.1, 1, 0.4, 1, duration: duration).delay(delay))
    }
}
