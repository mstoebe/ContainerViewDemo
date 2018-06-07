//
//  CollectionViewItem.swift
//  macOS_ContainerViews
//
//  Created by Markus Stöbe on 07.06.18.
//  Copyright © 2018 Markus Stöbe. All rights reserved.
//

import Cocoa

class CollectionViewItem: NSCollectionViewItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
		view.wantsLayer = true
		view.layer?.backgroundColor = NSColor.green.cgColor
    }
    
}
