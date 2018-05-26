//
//  TableViewController.swift
//  iOS_CollectionViews
//
//  Created by Markus Stöbe on 26.05.18.
//  Copyright © 2018 Markus Stöbe. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	//******************************************************************************************************************
	//* TableView-Stuff
	//******************************************************************************************************************
	@IBOutlet weak var tableView: UITableView!

	let kCellID = "myCellID"

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1		// Default is 1 if not implemented
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 20
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = self.tableView.dequeueReusableCell(withIdentifier: kCellID)
		if (cell == nil) {
			cell = UITableViewCell.init(style:.default, reuseIdentifier:kCellID)
		}

		switch (indexPath.row) {
		default:
			cell?.textLabel?.text = "Text für Zelle \(indexPath.row)"
			break
		}

		return cell!
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}



}
