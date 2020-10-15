//
//  Localization.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/10/16.
//

import Foundation

/**
  NSL: `NSLocalizedString` 的简洁用法。在 Config.plist 中可以配置使用的表明。
 */
func NSL(_ stringName:String) -> String {
    var config: NSDictionary = getPropertyList(name: "Config")
    return NSLocalizedString(stringName, tableName: config["LOCALIZATION_FILENAME"] as? String, comment: "")
}


