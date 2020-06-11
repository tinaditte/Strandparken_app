//
//  PDFHandler.swift
//  Strandparken_portal
//
//  Created by Tina Thomsen on 02/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

class PDFHandler {
	static let db = Firestore.firestore()
	static let storage = Storage.storage()
	static var list = [PDF]()
	static var downloadURL : String?
	
	static func startListener(tableView: UITableView){
		print("Listening has begun")
		db.collection("PDF").addSnapshotListener { (snap, error) in
			if error == nil{
				self.list.removeAll()
				for pdf in snap!.documents{
					let map = pdf.data()
					let head = map["Headline"] as! String
					let url = map["URL"] as? String ?? "empty"
					
					let newPDF = PDF(id: pdf.documentID, headline: head, url: url)
					print(newPDF)
					self.list.append(newPDF)
				}
				DispatchQueue.main.async {
					tableView.reloadData()
				}
			}
		}
	}
	
	static func downloadPdfs(pdfInList : Int){
		let aPdf = getPDFat(index: pdfInList)
		print("Download initiated")
		let pdfUrl = aPdf.url
		let pdfRef = storage.reference(withPath: pdfUrl)
		pdfRef.downloadURL { (url, error) in
			print(url)
			if error == nil{
				let urlString = url!.absoluteString
				print(urlString)
				downloadURL = urlString
			}else{
				print("An error occured trying to download the url")
			}
		}
	}
		
	static func getSize() -> Int{
		return list.count
	}
	
	static func getPDFat(index: Int) -> PDF{
		return list[index]
	}
}
