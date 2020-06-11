//
//  DocPick.swift
//  Strandparken_portal
//
//  Created by Tina Thomsen on 01/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit
import MobileCoreServices

class DocPick: UIViewController, UIDocumentPickerDelegate, UIDocumentMenuDelegate {
	var documentPicker = UIDocumentPickerViewController()
	let types: [String] = [kUTTypePDF as String]
	
    override func viewDidLoad() {
        super.viewDidLoad()

    }
	
	func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt url: URL) {
		let myURL = url as URL
		print("Import result: \(myURL)")
	}
	
	func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
		documentPicker.delegate = self
		self.present(documentPicker, animated: true, completion: nil)
	}
	
	func openfile(){
		let importMenu = UIDocumentMenuViewController(documentTypes: types, in: .import)
		importMenu.delegate = self
		importMenu.modalPresentationStyle = .fullScreen
		self.present(importMenu, animated: true, completion: nil)
	}
	
	@IBAction func downloadTapped(_ sender: Any) {
		documentPicker = UIDocumentPickerViewController(documentTypes: types, in: .import)
		documentPicker.modalPresentationStyle = .formSheet
		openfile()
		
	}
	
	
	

}
