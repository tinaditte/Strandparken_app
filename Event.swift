//
//  Event.swift
//  Strandparken_portal
//
//  Created by Tina Thomsen on 02/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation
class Event {
	var id: String
	var date: String
	var headline : String
	var description: String
	var time : String
	var place : String
	var host : String
	
	init(id: String, date: String, headline: String, description: String, time: String, place: String, host: String) {
		self.id = id
		self.date = date
		self.headline = headline
		self.description = description
		self.time = time
		self.place = place
		self.host = host
	}
}
