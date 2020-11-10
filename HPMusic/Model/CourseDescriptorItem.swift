//
//  CourseDescriptorItem.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/11/9.
//

import Foundation

class CourseDescriptorItem {
    var time: Date
    var text: String
    
    init(_ time: Date, _ text: String) {
        self.time = time
        self.text = text
    }
}
