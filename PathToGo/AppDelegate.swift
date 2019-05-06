//
//  AppDelegate.swift
//  PathToGo
//
//  Created by Hanson on 2018/1/23.
//  Copyright © 2018年 HansonStudio. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var toastWindowCtrl: ToastWindowController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        ScriptService.copyCurrentFinderPath()
        
        makeToast("Copy Path to ClipBoard Success")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        
    }
    
}

extension AppDelegate {
    func makeToast(_ message: String) {
        if toastWindowCtrl != nil {
            toastWindowCtrl.close()
        }
        toastWindowCtrl = ToastWindowController(windowNibName: "ToastWindowController")
        toastWindowCtrl.message = message
        toastWindowCtrl.showWindow(self)
        //NSApp.activate(ignoringOtherApps: true)
        //toastWindowCtrl.window?.makeKeyAndOrderFront(self)
        toastWindowCtrl.fadeInHud()
    }
}

