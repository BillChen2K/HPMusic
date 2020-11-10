//
//  CourseDescriptorItem.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/11/9.
//

import Foundation

class CourseDescriptorItem {
    // 以秒为单位的说明
    
    var time: Double
    var text: String
    
    init(_ time: Double, _ text: String) {
        self.time = time
        self.text = text
    }
}
