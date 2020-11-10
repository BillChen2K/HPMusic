//
//  CoursePlayerController.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/11/10.
//

import Foundation
import AVKit

// 和课程播放有关的控制器
class CoursePlayerController {
    
    func createLocalUrl(for filename: String, ofType: String) -> URL? {
           let fileManager = FileManager.default
           let cacheDirectory = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
           let url = cacheDirectory.appendingPathComponent("\(filename).\(ofType)")
           
           guard fileManager.fileExists(atPath: url.path) else {
               guard let video = NSDataAsset(name: filename)  else { return nil }
               fileManager.createFile(atPath: url.path, contents: video.data, attributes: nil)
               return url
           }
           
           return url
       }
    
    func createAVPlayer(_ source: String) -> AVPlayer {
        if source.hasPrefix("http") {
            // Online
            return AVPlayer(url: URL(string: source)!)

        }
        else {
            // Local
            return AVPlayer(url: self.createLocalUrl(for: source, ofType: "mp4")! as URL)

        }
    }
}
