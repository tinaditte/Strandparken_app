//
//  EventViewController.swift
//  Strandparken
//
//  Created by Tina Thomsen on 29/05/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var headlineLabel: UILabel!
	@IBOutlet weak var textView: UITextView!
	
	@IBOutlet weak var timesetLabel: UILabel!
	@IBOutlet weak var placesetLabel: UILabel!
	@IBOutlet weak var hostsetLabel: UILabel!
	
	var rowNumber  = 0
	
    override func viewDidLoad() {
        super.viewDidLoad()
		dateLabel.text = dateString
    }
	
	override func viewWillAppear(_ animated: Bool) {
		let checkEvent = DateFormat.slizeDate(data: dateLabel.text!)
		let theEvent = EventHandler.checkForEvents(date: checkEvent)
		
		headlineLabel.text = theEvent.headline
		textView.text = theEvent.description
		timesetLabel.text = theEvent.time
		placesetLabel.text = theEvent.place
		hostsetLabel.text = theEvent.host
	}
	
	
}
