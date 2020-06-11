//
//  CollectionViewCell.swift
//  Strandparken
//
//  Created by Tina Thomsen on 31/05/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var headlineLabel: UILabel!
	@IBOutlet weak var bodyTV: UITextView!
	@IBOutlet weak var dateLabel: UILabel!
	
	
	func setUpPin(pin: Pin){
		let pinID = pin.id
		headlineLabel.text! = pin.headline
		bodyTV.text! = pin.description
		dateLabel.text! = pin.date
	}
}
