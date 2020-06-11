//
//  PinBoardViewController.swift
//  Strandparken
//
//  Created by Tina Thomsen on 29/05/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class PinBoardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
	@IBOutlet weak var board: UICollectionView!
	
	private var newPinMode = false
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		board.delegate = self
		board.dataSource = self
		
		PinHandler.ListenforPins(collectionView: board)
		
	}

	override func viewWillAppear(_ animated: Bool) {
		board.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "addPinSegue" {
			newPinMode = true
			if let destination = segue.destination as? PinDetailViewController{
				destination.behaveAsNew = newPinMode
			}
		}
		if segue.identifier == "viewPinSegue" {
			if let destination = segue.destination as? PinDetailViewController, let index = board.indexPathsForSelectedItems?.first{
				destination.rowNumber = board.indexPathsForSelectedItems!.first!.row
			}
		}
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		//print("The size fetched from Pinhandler in numberOfItemsInSection: \(PinHandler.getSize())")
		return PinHandler.getSize()
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let pin = PinHandler.getPinAt(Index: indexPath.row)
		let cell = board.dequeueReusableCell(withReuseIdentifier: "pinCell", for: indexPath) as! CollectionViewCell
		cell.setUpPin(pin: pin)
		
		return cell
	}
	
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle selected pin
		print("You selected cell #\(indexPath.item)!")
		performSegue(withIdentifier: "viewPinSegue", sender: self)
	}
}
