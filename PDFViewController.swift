//
//  PDFViewController.swift
//  Strandparken_portal
//
//  Created by Tina Thomsen on 02/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import UIKit
import WebKit

class PDFViewController: UIViewController, WKUIDelegate{
	@IBOutlet weak var pdfView: WKWebView!
	
	var rowNumber = 0
	var url = ""
	
    override func viewDidLoad() {
        super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		 PDFHandler.downloadPdfs(pdfInList: rowNumber)
	}
	
	func getURL(){
		let pdfurl = PDFHandler.downloadURL!
		let url =  URL(string: pdfurl)!
		let postRequest = URLRequest(url: url)
		pdfView.load(postRequest)
	}

}
