//
//  FinderSync.swift
//  PathToGoFinderExtension
//
//  Created by Hanson on 2020/6/11.
//  Copyright © 2020 HansonStudio. All rights reserved.
//

import Cocoa
import FinderSync

class FinderSync: FIFinderSync {
    
    override init() {
        super.init()
    }
    
    override var toolbarItemName: String {
        return "PathToGo"
    }
    
    override var toolbarItemToolTip: String {
        return "PathToGo: Click to Copy the current directory's path to the clipboard"
    }
    
    override var toolbarItemImage: NSImage {
        let icon = NSImage(named: "PathToGoExtension")
        icon?.isTemplate = true
        return icon!
    }
    
    override func menu(for menuKind: FIMenuKind) -> NSMenu {
        let menu = NSMenu(title: "")
        menu.addItem(withTitle: "Copy The Path", action: #selector(copyPlainText(_:)), keyEquivalent: "")
        menu.addItem(withTitle: "Copy The Path With Backslash Escaping For Space", action: #selector(copySpaceBackslashText(_:)), keyEquivalent: "")
        return menu
    }
    
    @IBAction func copyPlainText(_ sender: AnyObject?) {
        copyPaths()
    }
    
    @IBAction func copySpaceBackslashText(_ sender: AnyObject?) {
        copyPaths(shouldAddSpaceBackSlash: true)
    }
    
    private func copyPaths(shouldAddSpaceBackSlash: Bool = false) {
        guard let target = FIFinderSyncController.default().targetedURL()
            , let selectedItems = FIFinderSyncController.default().selectedItemURLs() else { return }
        
        var itemURLString = ""
        for (index, item) in selectedItems.enumerated() {
            itemURLString = itemURLString + item.path
            if index != selectedItems.count - 1 {
                itemURLString = itemURLString + "\n"
            }
        }
        
        // When Only select the target folder, the selectedItems is empty
        // 仅仅选中 Target fodler 的时候 selectedItems 是空的
        if itemURLString.count == 0 {
            itemURLString = target.path
        }
        var result: String
        if shouldAddSpaceBackSlash {
            result = itemURLString.replacingOccurrences(of: " ", with: "\\ ")
        } else {
            result = itemURLString
        }
        
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString("\(result)", forType: .string)
    }
}

