//
//  UserHandler.swift
//  Strandparken
//
//  Created by Tina Thomsen on 29/05/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit
import FirebaseFirestore

class UserHandler{
	static var list = [User]()
	static let DB = Firestore.firestore()
	static var value = 0
	static var aUser = User(uid: "", email: "", name: "", address: "", adminStatus: false)
	
	static func Create(email: String, name: String, address: String, password: String, adminstatus: Bool){
		let collectionRef = DB.collection("User")
		
		Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
			if error == nil{
				let userID = Auth.auth().currentUser!.uid
				collectionRef.document(userID).setData(["E-mail" : email, "Name": name, "Address" : address, "AdminStatus" : adminstatus])
				
				let newUser = User(uid: userID, email: email, name: name, address: address, adminStatus: adminstatus)

				Auth.auth().languageCode = "da"
				Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
					if error == nil{
						Alert.Alerting(type: "Info", message: "Bruger blev oprettet, og en bekræftigelse email blev sendt til brugeren.", vc: NewUserViewController())
					}else{
						Alert.Alerting(type: "Fejl", message: "Der opstod en fejl, da systemet forsøgte at sende en bekræftigelse email til brugeren.", vc: NewUserViewController())
					}
				})
				
			}else{
				Alert.Alerting(type: "Fejl", message: "Der opstod en fejl, da system forsøgte at oprette en bruger.", vc: NewUserViewController())
			}
		}
	}
	
	static func getCurrentUserInfo(uid: String)-> User{
		let docRef = DB.collection("User").document(uid).addSnapshotListener { (documentSnap, error) in
			if error == nil{
				self.list.removeAll()
				let map = documentSnap?.data()
				let uid = documentSnap!.documentID
				let name = map!["Name"] as! String
				let address = map!["Address"] as! String
				let adminstatus = map!["AdminStatus"] as! Bool
				let email = map!["E-mail"] as! String
				
				aUser = User(uid: uid, email: email, name: name, address: address, adminStatus: adminstatus)
				self.list.append(aUser)
			}
		}
		return aUser
	}
	
	static func getCurrentUserStatus(){
		let currentUserFetch = FirebaseAuth.Auth.auth().currentUser
		let currentUID = currentUserFetch?.uid
		
		DB.collection("User").document(currentUID!).getDocument { (document, error) in
			if let document = document, document.exists{
				let data = document.get("AdminStatus")
				value = data! as! Int
				print(value)
			}
		}
	}
	
	static func getCurrentUID()-> String{
		return FirebaseAuth.Auth.auth().currentUser!.uid
	}
}
