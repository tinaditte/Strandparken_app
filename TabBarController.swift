//
//  TabBarController.swift
//  Strandparken
//
//  Created by Tina Thomsen on 30/05/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
	let adminViewC = AdminViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
		UserHandler.getCurrentUserStatus()
		self.navigationItem.hidesBackButton = true
	}
	
	
}
