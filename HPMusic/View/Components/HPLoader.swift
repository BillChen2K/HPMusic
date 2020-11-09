//
//  HPLoader.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/10/20.
//

import SwiftUI

enum LoaderSize: CaseIterable {
    case Big
    case Normal
    case Small
    case Inline
}

struct HPLoader: View {
    var strokeColor: Color
    var size: LoaderSize = .Normal

    @State private var isLoading: Bool = false
    private var sizeMultiplier: CGFloat {
        switch self.size {
        case .Big:
            return 1.5
        case .Normal:
            return 1
        case .Small:
            return 0.6
        case .Inline:
            return 0.4
        }
    }

    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(strokeColor, lineWidth: max(5 * self.sizeMultiplier, 4))
            .frame(width: 50 * CGFloat(self.sizeMultiplier), height: 50 * CGFloat(self.sizeMultiplier))
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: false))
            .onAppear(){
                self.isLoading = true;
            }
    }
}


struct HPLoader_Previews: PreviewProvider {
    static var previews: some View {
        HPLoader(strokeColor: Color.black, size: .Inline)
    }
}
