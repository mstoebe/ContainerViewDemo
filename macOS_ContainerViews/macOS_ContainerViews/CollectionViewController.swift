//
//  CollectionViewController.swift
//  macOS_ContainerViews
//
//  Created by Markus Stöbe on 07.06.18.
//  Copyright © 2018 Markus Stöbe. All rights reserved.
//

import Cocoa

class CollectionViewController: NSViewController, NSCollectionViewDataSource {

	@IBOutlet weak var collectionView: NSCollectionView!

	override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
//		let myLayout = NSCollectionViewFlowLayout()
//		myLayout.itemSize = NSSize(width: 80.0, height: 80.0)
//		myLayout.sectionInset = NSEdgeInsets(top: 10.0, left: 10.0,
//										     bottom: 10.0, right: 10.0)
//		myLayout.minimumInteritemSpacing = 10.0
//		myLayout.minimumLineSpacing = 10.0
//		collectionView.collectionViewLayout = myLayout
    }

	//******************************************************************************************************************
	//* MARK: - Datasource
	//******************************************************************************************************************

	func numberOfSections(in collectionView: NSCollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
		return 20
	}

	func collectionView(_ itemForRepresentedObjectAtcollectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
		let item = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier("CollectionViewItem"), for: indexPath)
		//fill item with data here
		return item
	}

    
}
