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
        let piano001: CourseModel = CourseModel(instrument: "钢琴", name: "拇指移位练习", introduction: "车尔尼599第20首，钢琴小白或有一定钢琴基础的人群。目标是让学生掌握断奏、连奏的技巧；左右手协调配合合奏出旋律。")
//        let leftStage: CourseStage = CourseStage(midi: "piano001_lefthand_midi",
//                                                 video: "piano001_lefthand_video", score: "piano001_lefthand_score")
//        let rightStage: CourseStage = CourseStage(midi: "piano001_righthand_midi",
//                                                  video: "piano001_righthand_video", score: "piano001_righthand_score")
//        let bothStage: CourseStage = CourseStage(midi: "piano001_bothhand_midi",
//                                                 video: "piano001_bothhand_video", score: "piano001_bothhand_score")
        let leftStage: CourseStage = CourseStage(midi: "piano001_lefthand_midi",
                                                 video: "piano001_lefthand_video", score: "piano001_lefthand_score", stageName: "左手分解练习")
        leftStage.summary = "思想集中，让脑子走在眼睛的前面，眼睛走在手的前面"
        
        let rightStage: CourseStage = CourseStage(midi: "piano001_righthand_midi",
                                                  video: "piano001_righthand_video", score: "piano001_righthand_score", stageName: "右手分解练习")
        rightStage.summary = "有感情的演奏，表现这一乐句的活泼明亮的色彩"
        let bothStage: CourseStage = CourseStage(midi: "piano001_bothhand_midi",
                                                 video: "piano001_bothhand_video", score: "piano001_bothhand_score", stageName: "合并练习")
        bothStage.summary = "注意左右手的协调性，左手的声部声音弱于右手，不可过吵"
        let stages: [CourseStage] = [leftStage, rightStage, bothStage]
        piano001.stages = stages
        return piano001
    }

}
