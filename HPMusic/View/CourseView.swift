//
//  Course.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/10/16.
//
// 课时 Tab

import SwiftUI

struct CourseView: View {
   
    
    var body: some View {
        ScrollView {
            Image("demoTabPlan").resizable().aspectRatio(contentMode: .fit)
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
