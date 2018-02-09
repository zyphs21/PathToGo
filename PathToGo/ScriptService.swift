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
        guard let scriptUrl = Bundle.main.path(forResource: "copyCurrentPath", ofType: "scpt"),
            let string = try? String(contentsOf: URL(fileURLWithPath: scriptUrl)) else {
                return
        }
//        guard let scriptUrl = Bundle.main.url(forResource: "copyCurrentPath", withExtension: "scpt"),
//            let string = try? String(contentsOf: scriptUrl) else {
//                return
//        }
        
        let script = NSAppleScript(source: string)
        guard let pathString = script?.executeAndReturnError(nil).stringValue else {
            return
        }
        
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(pathString, forType: .string)
    }
    
    
}
