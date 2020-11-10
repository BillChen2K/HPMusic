//
//  Course.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/11/9.
//

import Foundation

class CourseModel: Identifiable {
    
    init(instrument: String, name: String, introduction: String) {
        self.instrument = instrument
        self.courseName = name
        self.courseIntroduction = introduction
    }
    public var instrument: String = ""
    public var courseName: String = ""
    public var courseIntroduction: String = ""
    public var stages: [CourseStage] = []
    
}
