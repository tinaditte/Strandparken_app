//
//  ReportViewController.swift
//  Strandparken
//
//  Created by Tina Thomsen on 29/05/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.delegate = self
		tableView.dataSource = self
		PDFHandler.startListener(tableView: tableView)
		
    }
	
	override func viewWillAppear(_ animated: Bool) {
		tableView.reloadData()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return PDFHandler.getSize()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "PDFCell")
		cell?.textLabel?.text = PDFHandler.getPDFat(index: indexPath.row).headline
		
		return cell!
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let destination = segue.destination as? PDFViewController{
			destination.rowNumber = tableView.indexPathForSelectedRow!.row
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("Selected row numver \(indexPath.row)")
	}
	
}
