//
//  Localization.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/10/16.
//

import Foundation
import SwiftUI

/**
  NSL: `NSLocalizedString` 的简洁用法。在 Config.plist 中可以配置使用的表名。
 */
func NSL(_ stringName:String) -> String {
    let config: NSDictionary = getPropertyList(name: "Config")
    return NSLocalizedString(stringName, tableName: config["LOCALIZATION_FILENAME"] as? String, comment: "")
}

/**
  TextNSL: `NSLocalizedString` 包裹在 Text 中的简洁用法。在 Config.plist 中可以配置使用的表明。
 */
func TextNSL(_ stringName:String) -> Text {
    let config: NSDictionary = getPropertyList(name: "Config")
    return Text(NSLocalizedString(stringName, tableName: config["LOCALIZATION_FILENAME"] as? String, comment: ""))
}

/// Use `.localized` extension to localized the Strings in a more convenient way.
extension String {
    var localized: String {
        let config: NSDictionary = getPropertyList(name: "Config")
        return NSLocalizedString(self, tableName: config["LOCALIZATION_FILENAME"] as? String, bundle: Bundle.main, value: "", comment: "")
    }
}


