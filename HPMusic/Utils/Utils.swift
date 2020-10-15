//
//  Utils.swift
//  HPMusic
//
//  Created by Bill Chen on 2020/10/16.
//

import Foundation

func getPropertyList(name: String) -> NSDictionary {
        
    // First let's get the path to our property list
    guard let path = Bundle.main.path(forResource: name, ofType: "plist"),
        let xml = FileManager.default.contents(atPath: path) else {
    // If the property list doesn't exist, we'll throw an error for now.
        fatalError("Unable to load the requested property list")
    }
    // With data read into the xml variable we can now decode into a dictionary object.
    let propertyDictionary = try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil) as? NSDictionary
    return propertyDictionary!
        
}
