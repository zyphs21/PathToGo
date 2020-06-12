//
//  ScriptService.swift
//  PathToGo
//
//  Created by Hanson on 2018/1/23.
//  Copyright © 2018年 HansonStudio. All rights reserved.
//

import Cocoa

struct ScriptService {
    
    static func copyCurrentFinderPath() {
        // Bundle.main.url(forResource: "copyCurrentPath", withExtension: "scpt")
        // String(contentsOf: URL(fileURLWithPath: scriptUrl))
        guard let scriptUrl = Bundle.main.path(forResource: "copyCurrentPath", ofType: "scpt")
            , let script = NSAppleScript(contentsOf: URL(fileURLWithPath: scriptUrl), error: nil) else {
                print("---No Script Source File---")
                return
        }
        guard let pathString = script.executeAndReturnError(nil).stringValue else {
            print("---Script Execute Error---")
            return
        }
        
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(pathString, forType: .string)
    }
}
