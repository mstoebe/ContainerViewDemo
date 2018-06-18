//
//  GridViewController.swift
//  macOS_ContainerViews
//
//  Created by Markus Stöbe on 18.06.18.
//  Copyright © 2018 Markus Stöbe. All rights reserved.
//

import Cocoa

class GridViewController: NSViewController {

	@IBOutlet weak var dropDownLabel: NSTextField!
	@IBOutlet weak var secondLabel: NSTextField!
	@IBOutlet weak var dropDownPopup: NSPopUpButton!
	@IBOutlet weak var firstOptionCheckbox: NSButton!
	@IBOutlet weak var secondOptionCheckbox: NSButton!
	@IBOutlet weak var thirdOptionCheckbox: NSButton!
	@IBOutlet weak var fourthOptionCheckbox: NSButton!
	@IBOutlet weak var lastOptionCheckbox: NSButton!
		
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		let newGridView = createGridView()
		newGridView.frame = self.view.frame
		self.view.addSubview(newGridView)
	}
	
	//******************************************************************************************************************
	//* MARK: - Gridview erzeugen und parametrieren
	//* ACHTUNG: Das ganze hier ist ab Xcode 10 nicht mehr nötig! :)
	//*          Ab dann kann man diese Views im InterfaceBuilder erzeugen.
	//******************************************************************************************************************
	
	func createGridView () -> NSGridView {
		let emptyCell = NSGridCell.emptyContentView
		let gridView  = NSGridView(views: [
			[dropDownLabel, dropDownPopup],
			[emptyCell, firstOptionCheckbox],
			[emptyCell, secondOptionCheckbox],
			[secondLabel, thirdOptionCheckbox],
			[emptyCell, fourthOptionCheckbox],
			[lastOptionCheckbox]
			])
		
		//keine zu großen Lücken zwischen den Sektionen erzeugen
		gridView.setContentHuggingPriority(NSLayoutConstraint.Priority.defaultHigh, for: .horizontal)
		gridView.setContentHuggingPriority(NSLayoutConstraint.Priority.defaultHigh, for: .vertical)
		
		//erste Spalte rechtsbündig anzeigen
		gridView.column(at: 0).xPlacement = .trailing
		
		
		//Text links und rechts auf gleiche Höhe bringen (und nicht die Bounding-Box der Elemente)
		gridView.rowAlignment = .firstBaseline
		
		// We need a little extra vertical space around the popup:
		let row = gridView.cell(for: dropDownPopup)!.row!
		row.topPadding = 5
		row.bottomPadding = 5
		gridView.cell(for:secondLabel)!.row!.topPadding = 6
		
		// Special treatment for centered checkbox:
		let cell = gridView.cell(for: lastOptionCheckbox)!
		cell.row!.topPadding = 4
		cell.row!.mergeCells(in: NSMakeRange(0, 2))
		cell.xPlacement = .none
		let centering = lastOptionCheckbox.centerXAnchor.constraint(equalTo: fourthOptionCheckbox.leadingAnchor)
		cell.customPlacementConstraints = [centering]
		
		return gridView
	}
	

}
