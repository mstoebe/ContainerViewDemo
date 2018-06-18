//
//  ViewController.swift
//  macOS_ContainerViews
//
//  Created by Markus Stöbe on 26.05.18.
//  Copyright © 2018 Markus Stöbe. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		self.view.layer?.backgroundColor = CGColor.white
		
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

