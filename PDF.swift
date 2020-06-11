//
//  PDF.swift
//  Strandparken_portal
//
//  Created by Tina Thomsen on 02/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation

class PDF{
	var id : String
	var headline : String
	var url : String
	
	init(id: String, headline: String, url: String){
		self.id = id
		self.headline = headline
		self.url = url
	}
}
