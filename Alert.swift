//
//  Alert.swift
//  Strandparken
//
//  Created by Tina Thomsen on 30/05/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation
import UIKit

class Alert{
	
	static func Alerting(type: String, message: String, vc: UIViewController){
		let alertController = UIAlertController(title: type, message: message, preferredStyle: .alert)
		let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
		 alertController.addAction(defaultAction)
		
		vc.present(alertController, animated: true, completion: nil)
	}
	
}
