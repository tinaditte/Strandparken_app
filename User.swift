//
//  User.swift
//  Strandparken
//
//  Created by Tina Thomsen on 29/05/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation

class User{
	var uid: String
	var email: String
	var name: String
	var address: String
	var adminStatus: Bool
	
	init(uid: String, email: String, name: String, address: String, adminStatus: Bool) {
		self.uid = uid
		self.email = email
		self.name = name
		self.address  = address
		self.adminStatus = adminStatus
	}
}
