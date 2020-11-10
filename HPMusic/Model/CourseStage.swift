//
//  CourseSequence.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/11/9.
//

// 表示一个课程中的一个阶段

import Foundation

class CourseStage {
    
    public var midi: String = ""
    public var video: String = ""
    public var score: String = ""
    public var descriptors: [CourseDescriptorItem]
    
    init(midi: String, video: String, score: String) {
        self.midi = midi
        self.video = video
        self.score = score
        self.descriptors = []
    }
    

}
