//
//  Pin.swift
//  Strandparken
//
//  Created by Tina Thomsen on 31/05/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation
import UIKit

class Pin {
	var id: String
	var headline: String
	var description: String
	var date: String
	var Uid: String
	
	init(id: String, headline: String, description:  String, date: String, Uid: String) {
		self.id = id
		self.headline = headline
		self.description = description
		self.date = date
		self.Uid = Uid
 	}
	
}
