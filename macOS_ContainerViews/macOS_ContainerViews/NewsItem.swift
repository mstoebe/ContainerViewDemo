//
//  NewsItem.swift
//  macOS_ContainerViews
//
//  Created by Markus Stöbe on 11.06.18.
//  Copyright © 2018 Markus Stöbe. All rights reserved.
//

import Cocoa

class NewsItem: NSObject {
	var date:String = ""
	var headlines:Array<String> = [""]

	init(date:String, headlines:Array<String>) {
		self.date = date
		self.headlines = headlines
	}
}
