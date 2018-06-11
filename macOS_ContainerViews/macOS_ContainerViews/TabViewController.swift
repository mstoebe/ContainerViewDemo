//
//  TabViewController.swift
//  macOS_ContainerViews
//
//  Created by Markus Stöbe on 07.06.18.
//  Copyright © 2018 Markus Stöbe. All rights reserved.
//

import Cocoa

class TabViewController: NSViewController {

	let entries : Array<NewsItem> =
				  [NewsItem.init(date: "Heute", headlines: ["Headline 1","Headline 2","Headline 3"]),
				   NewsItem.init(date: "Gestern", headlines: ["Headline 4","Headline 5","Headline 6"]),
				   NewsItem.init(date: "Vorgestern", headlines: ["Headline 7"]),
				   NewsItem.init(date: "Freitag", headlines: ["Headline 8","Headline 9"])]


	let cellIDs = ["OutlineDateCell","OutlineTitleCell"]

}

//******************************************************************************************************************
//* MARK: - Extension for OutlineView
//******************************************************************************************************************
extension TabViewController: NSOutlineViewDataSource, NSOutlineViewDelegate {

	//******************************************************************************************************************
	//* MARK: - NSOutlineViewDataSource
	//******************************************************************************************************************
	func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
		//it item is a NewsItem, count all entries for that day
		if let entriesForDay = item as? NewsItem {
			return entriesForDay.headlines.count
		}
		//otherwise we should return the number of days we have news for
		return entries.count
	}

	func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
		//it item is a NewsItem, return headline at index
		if let entriesForDay = item as? NewsItem {
			return entriesForDay.headlines[index]
		}
		//otherwise we should return the whole NewsItem for index
		return entries[index]
	}

	func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
		//it item is a NewsItem, count all entries for that day and if gt 0 return true
		if let entriesForDay = item as? NewsItem {
			return entriesForDay.headlines.count-1 > 0
		}
		return false
	}

	//******************************************************************************************************************
	//* MARK: - NSOutlineViewDelegate
	//******************************************************************************************************************
	func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {

		//first lets see if we are asked for a date or a headline
		var column = 0
		if tableColumn?.identifier.rawValue == "Title"{		//this identifier is set in IN as a property of the Titel-Cell!
			column = 1
		}

		//then make an appropriate cell for it an fill it
		if let cell = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(cellIDs[column]), owner: self) as? NSTableCellView{

			//if the given item is an array, we should return a cell containing the day-string
			if let entriesForDay = item as? NewsItem {
				if column == 0 {
					cell.textField?.stringValue = entriesForDay.date
				} else {
					if entriesForDay.headlines.count > 1 {
						cell.textField?.stringValue = ""
					} else {
						cell.textField?.stringValue = entriesForDay.headlines[0]
					}
				}
			} else {
				if column == 0 {
					cell.textField?.stringValue = ""
				} else {
					cell.textField?.stringValue = item as! String
				}

			}
			return cell
		}
		return nil
	}


}
