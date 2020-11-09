//
//  Course.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/11/9.
//

import Foundation

class PianoCourse: Identifiable {
    
    init() {
        
    }
    
    public var courseName: String = ""
    
    public var lefthand_video: String = ""
    public var lefthand_midi: String = ""
    public var lefthand_score: String = ""
    
    public var righthand_video: String = ""
    public var righthand_midi: String = ""
    public var righthand_score: String = ""
    
    public var bothhand_video: String = ""
    public var bothhand_midi: String = ""
    public var bothhand_score: String = ""
    
    public var descriptiontimeline
}
