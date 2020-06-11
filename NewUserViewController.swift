//
//  NewUserViewController.swift
//  Strandparken
//
//  Created by Tina Thomsen on 29/05/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController {
	@IBOutlet weak var emailtf: UITextField!
	@IBOutlet weak var navntf: UITextField!
	@IBOutlet weak var addressetf: UITextField!
	@IBOutlet weak var status: UISwitch!
	
	let password = "123456"
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func submitPressed(_ sender: Any) {
		let email = emailtf.text!
		let name = navntf.text!
		let address = addressetf.text!
		let adminstatus = status.isOn
		print(adminstatus)
		
		UserHandler.Create(email: email, name: name, address: address, password: password, adminstatus: adminstatus)
	}
}
