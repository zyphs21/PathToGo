//
//  ViewController.swift
//  PathToGo
//
//  Created by Hanson on 2018/1/23.
//  Copyright © 2018年 HansonStudio. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var toastWindowCtrl: ToastWindowController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ScriptService.copyCurrentFinderPath()
        
        makeToast("Copy Path to ClipBoard Success")
        
        // 0.01
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            NSApplication.shared.terminate(self)
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func makeToast(_ message: String) {
        if toastWindowCtrl != nil {
            toastWindowCtrl.close()
        }
        toastWindowCtrl = ToastWindowController(windowNibName: NSNib.Name(rawValue: "ToastWindowController"))
        toastWindowCtrl.message = message
        toastWindowCtrl.showWindow(self)
        //NSApp.activate(ignoringOtherApps: true)
        //toastWindowCtrl.window?.makeKeyAndOrderFront(self)
        toastWindowCtrl.fadeInHud()
    }
}

