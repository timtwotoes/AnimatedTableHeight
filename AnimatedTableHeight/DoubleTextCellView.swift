//
//  DoubleTextCellView.swift
//  AnimatedTableHeight
//
//  Created by Tim Wolff on 14/03/2019.
//  Copyright © 2019 Tim Wolff. All rights reserved.
//

import Cocoa

class DoubleTextCellView: NSTableCellView {
    @IBOutlet weak var stack: NSStackView!
    @IBOutlet weak var topTextField: NSTextField!
    @IBOutlet weak var bottomTextField: NSTextField!
    
    var topText: String {
        get {
            return topTextField.stringValue
        }
        set {
            topTextField.stringValue = newValue
        }
    }
    
    var bottomText: String {
        get {
            return bottomTextField.stringValue
        }
        set {
            bottomTextField.stringValue = newValue
        }
    }
    
    var textFieldSpacing: CGFloat {
        get {
            return stack.spacing
        }
        set {
            stack.animator().spacing = newValue
//            stack.spacing = newValue
        }
    }
}

extension NSTableCellView {
    static var cellDoubleTextIdentifier: NSUserInterfaceItemIdentifier {
        return NSUserInterfaceItemIdentifier(rawValue: "doubleTextCell")
    }
}
