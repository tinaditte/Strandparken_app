//
//  CreateEventViewController.swift
//  Strandparken_portal
//
//  Created by Tina Thomsen on 02/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
	@IBOutlet weak var headlineTF: UITextField!
	@IBOutlet weak var bodyTV: UITextView!
	@IBOutlet weak var timeTF: UITextField!
	@IBOutlet weak var placeTF: UITextField!
	@IBOutlet weak var hostTF: UITextField!
	@IBOutlet weak var dateTF: UITextField!
	
	var datePicker: UIDatePicker?
	var timePicker: UIDatePicker?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		date()
		time()
		
	}
	
	func date(){
		datePicker = UIDatePicker()
		datePicker?.datePickerMode = .date
		datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
		
		dateTF.inputView = datePicker
	}
	
	func time(){
		timePicker = UIDatePicker()
		timePicker?.datePickerMode = .time
		timePicker?.addTarget(self, action: #selector(timeChanged(timePicker:)), for: .valueChanged)
		
		timeTF.inputView = timePicker
		
	}
	
	func gesture(){
		let tapgesture = UITapGestureRecognizer(target: self, action: #selector(CreateEventViewController.viewTappet(gestureRecogn:)))
		view.addGestureRecognizer(tapgesture)
	}
	
	@objc func viewTappet(gestureRecogn : UITapGestureRecognizer){
		view.endEditing(true)
	}
	
	@objc func dateChanged(datePicker: UIDatePicker){
		dateTF.text = DateFormat.dkDateFormat(Date: datePicker.date)
	}
	
	@objc func timeChanged(timePicker: UIDatePicker){
		timeTF.text = DateFormat.getTime(Time: timePicker.date)
	}
	
	@IBAction func saveEvent(_ sender: Any) {
		let dateString = dateTF.text!
		let timeString = timeTF.text!
		print("Date: \(dateString), Time: \(timeString)")
		EventHandler.CreateEvent(date: dateString, headline: headlineTF.text!, description: bodyTV.text!, time: timeString, place: placeTF.text!, host: hostTF.text!)
		Alert.Alerting(type: "Info", message: "The event was added!", vc: self)
	}
	
}
