//
//  ViewController.swift
//  AnimatedTableHeight
//
//  Created by Tim Wolff on 14/03/2019.
//  Copyright © 2019 Tim Wolff. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    @IBOutlet weak var table: NSTableView!
    var tableEntries = [(first: "Top text", second: "Bottom text"), (first: "Hip", second: "Hop")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Tableview Delegate
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cell = tableView.makeView(withIdentifier: NSTableCellView.cellDoubleTextIdentifier, owner: self) as? DoubleTextCellView else {
            return nil
        }
        
        let entry = tableEntries[row]
        cell.topText = entry.first
        cell.bottomText = entry.second
        return cell
    }
    
    // MARK: Tableview Datasource
    func numberOfRows(in tableView: NSTableView) -> Int {
        return tableEntries.count
    }

    // Buttons
    @IBAction func animateRowHeight(_ sender: NSButton) {
        if let cell = table.view(atColumn: 0, row: 0, makeIfNecessary: false) as? DoubleTextCellView,
           let cellTwo = table.view(atColumn: 0, row: 1, makeIfNecessary: false) as? DoubleTextCellView {
            // Batch animations in the table view
            table.beginUpdates()
            // Animate changing the spacing between the textfields and row height
            NSAnimationContext.runAnimationGroup { (context) in
                if cell.textFieldSpacing == 4 {
                    cell.textFieldSpacing = 50
                } else {
                    cell.textFieldSpacing = 4
                }
                
                if cellTwo.textFieldSpacing == 4 {
                    cellTwo.textFieldSpacing = 80
                } else {
                    cellTwo.textFieldSpacing = 4
                }
                
                table.noteHeightOfRows(withIndexesChanged: IndexSet(arrayLiteral: 0, 1))
            }
            table.endUpdates()
        }
    }
}

