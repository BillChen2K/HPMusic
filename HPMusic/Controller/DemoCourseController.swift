//
//  DemoCourseController.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/11/10.
//

import Foundation

// 用来导入 PIANO001 课程
class DemoCourseController {
    
    public func getPIANO001() -> CourseModel {
        var piano101: CourseModel = CourseModel(instrument: "钢琴", name: "大指移位练习", introduction: "车尔尼599第20首，钢琴小白或有一定钢琴基础的人群。目标是让学生掌握断奏、连奏的技巧；左右手协调配合合奏出旋律。")
        var leftStage: CourseStage = CourseStage(midi: "piano101_lefthand_midi", video: "piano101_lefthand_video", score: "piano101_lefthand_score")
        var rightStage: CourseStage = CourseStage(midi: "piano101_righthand_midi", video: "piano101_righthand_video", score: "piano101_righthand_score")
        var bothStage: CourseStage = CourseStage(midi: "piano101_bothhand_midi", video: "piano101_bothhand_video", score: "piano101_bothhand_score")
        let stages: [CourseStage] = [leftStage, rightStage, bothStage]
        piano101.courseStages = stages
        return piano101
    }

}
