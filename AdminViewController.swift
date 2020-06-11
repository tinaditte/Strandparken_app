//
//  AdminViewController.swift
//  Strandparken
//
//  Created by Tina Thomsen on 29/05/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
	@IBOutlet weak var containingView: UIView!
	
    override func viewDidLoad() {
		UserHandler.getCurrentUserStatus()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		if UserHandler.value == 1{ 		//Is admin
				containingView.isHidden = false
			}else{
				Alert.Alerting(type: "Error", message: "Du har ikke admin rettigheder", vc: self)
		}
	}
}
