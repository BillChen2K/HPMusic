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
    public var stageName: String = ""
    
    // 静态简介
    public var summary: String = ""
    
    // 动态简介
    public var descriptors: [CourseDescriptorItem]
    
    // 在界面上方的第二个辅助动态简介
    public var auxDescriptors: [CourseDescriptorItem]
    
    init(midi: String, video: String, score: String, stageName: String = "") {
        self.midi = midi
        self.video = video
        self.score = score
        self.descriptors = []
        self.auxDescriptors = []
        self.stageName = stageName
    }
    

}
