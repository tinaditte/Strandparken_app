//
//  LoginViewController.swift
//  Strandparken
//
//  Created by Tina Thomsen on 29/05/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
	@IBOutlet weak var emailtf: UITextField!
	@IBOutlet weak var passwordtf: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
	@IBAction func loginPressed(_ sender: Any) {
		loginCheck(email: emailtf.text!, password: passwordtf.text!)
	}
	
	func loginCheck(email: String, password: String){
		if emailtf.text == "" || passwordtf.text == ""{
			Alert.Alerting(type: "Fejl", message: "Email og/eller password felterne er ikke udfyldt.", vc: self)
		}else{
			Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
				if error == nil{
					self.performSegue(withIdentifier: "loginSegue", sender: Any?.self)
				}else{
					Alert.Alerting(type: "Fejl", message: "Der opstod en fejl, da der blev forsøgt at logge ind: \(String(describing: error?.localizedDescription))", vc: self)
				}
			}
			
		}
	}
	
	@IBAction func resetTapped(_ sender: Any) {
		//loginCheck(email: emailtf.text!, password: passwordtf.text!)
		Auth.auth().sendPasswordReset(withEmail: emailtf.text!) { (error) in
			if error == nil{
				Alert.Alerting(type: "Info", message: "En password nulstillings email blev sendt.", vc: self)
			}else{
				Alert.Alerting(type: "Fejl", message: "Der opstod en fejl, da der blev forsøgt at sende en password nulstillings email.", vc: self)
			}
		}
	}
	
}
