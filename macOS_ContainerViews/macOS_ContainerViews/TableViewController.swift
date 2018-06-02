//
//  TableViewController.swift
//  macOS_ContainerViews
//
//  Created by Markus Stöbe on 02.06.18.
//  Copyright © 2018 Markus Stöbe. All rights reserved.
//

import Cocoa

class TableViewController: ViewController, NSTableViewDelegate, NSTableViewDataSource {

	@IBOutlet weak var tableView: NSTableView!

	let entries = [["Heute","Headline 1"],
				   ["Gestern","Headline 2"],
				   ["Gestern","Headline 3"],
				   ["Montag","Headline 4"],
				   ["Sonntag","Headline 5"],
				   ["Freitag","Headline 6"],
				   ["Freitag","Headline 7"]]

	let cellIDs = ["DateCell","TitleCell"]

	//******************************************************************************************************************
	//* MARK: - NSTableViewDataSource
	//******************************************************************************************************************
	func numberOfRows(in tableView: NSTableView) -> Int {
		return entries.count
	}

	func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
		var column = 0

		if tableColumn?.identifier.rawValue == "Title"{
			column = 1
		} else {
			column = 0
		}

		if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(cellIDs[column]), owner: nil) as? NSTableCellView{
			cell.textField?.stringValue = entries[row][column]
			return cell
		}
		return nil
	}



}
