//
//  AppWorker.swift
//  PathToGo
//
//  Created by Hanson on 2018/1/23.
//  Copyright © 2018年 HansonStudio. All rights reserved.
//

import Cocoa

struct AppWorker {
    
    static func copyCurrentFinderPath() {
        guard let scriptUrl = Bundle.main.url(forResource: "copyCurrentPath", withExtension: "scpt"),
            let string = try? String(contentsOf: scriptUrl) else {
                return
        }
        
        let script = NSAppleScript(source: string)
        guard let pathString = script?.executeAndReturnError(nil).stringValue else {
            return
        }
        
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(pathString, forType: .string)
    }
    
//    func finderCurrentPath() -> String? {
//        guard let scriptUrl = Bundle.main.url(forResource: "copyCurrentPath", withExtension: "scpt"),
//            let string = try? String(contentsOf: scriptUrl) else {
//                return nil
//        }
//        
//        let script = NSAppleScript(source: string)
//        return script?.executeAndReturnError(nil).stringValue
//    }
//    
//    func run() {
//        guard let path = finderCurrentPath() else {
//            return
//        }
//        
//        let pasteboard = NSPasteboard.general
//        pasteboard.declareTypes([.string], owner: nil)
//        pasteboard.setString(path, forType: .string)
//    }
    
    
}
