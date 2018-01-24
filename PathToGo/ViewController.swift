//
//  ViewController.swift
//  PathToGo
//
//  Created by Hanson on 2018/1/23.
//  Copyright © 2018年 HansonStudio. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        AppWorker.copyCurrentFinderPath()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            NSApplication.shared.terminate(self)
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

