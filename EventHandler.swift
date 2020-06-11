//
//  EventHandler.swift
//  Strandparken_portal
//
//  Created by Tina Thomsen on 02/06/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

//Indlæs events fra firebase
//check hvis nogle datoer har events --> highlight it
// 

class EventHandler{
	static var list = [Event]()
	static let db = Firestore.firestore()
	static var anEvent = Event(id: "", date: "", headline: "", description: "", time: "", place: "", host: "")
	
	static func CreateEvent(date: String, headline: String, description: String, time: String, place: String, host: String)-> Event{
		var map = [String: String]()
		map["Date"] = date
		map["Headline"] = headline
		map["Description"] = description
		map["Time"] = time
		map["Place"] = place
		map["Host"] = host
		
		let docAdd = db.collection("Event").addDocument(data: map)
		
		Alert.Alerting(type: "Info", message: "Begivenheden blev oprettet.", vc: CreateEventViewController())
		let newEvent = Event(id: docAdd.documentID, date: date, headline: headline, description: description, time: time, place: place, host: host)
		list.append(newEvent)
		return newEvent
	}
	
	static func ListenForEvents(collectionView: UICollectionView){
		print("Listen for event")
		db.collection("Event").addSnapshotListener { (snap, error) in
			if error == nil{
				self.list.removeAll()
				for event in snap!.documents{
					let map = event.data()
					let date = map["Date"] as! String
					let headline = map["Headline"] as! String
					let description = map["Description"] as! String
					let time = map["Time"] as! String
					let place = map["Place"] as! String
					let host = map["Host"] as! String
					
					let readEvent = Event(id: event.documentID, date: date, headline: headline, description: description, time: time, place: place, host: host)
					list.append(readEvent)
					print("List of events, read from listener \(list)")
				}
				DispatchQueue.main.async{
					collectionView.reloadData()
				}
			}
		}
	}
	
	static func checkForEvents(date: String) -> Event{
		let docRef = db.collection("Event").whereField("Date", isEqualTo: date).getDocuments { (doc, error) in
			if error == nil{
				for doc in doc!.documents{
					print("\(doc.documentID) => \(doc.data())")
					let map = doc.data()
					let id = doc.documentID
					let theDate = map["Date"] as! String
					let description = map["Description"] as! String
					let headline = map["Headline"] as! String
					let host = map["Host"] as! String
					let time = map["Time"] as! String
					let place = map["Place"] as! String
				
					anEvent = Event(id: id, date: theDate, headline: headline, description: description, time: time, place: place, host: host)
				}
			}
		}
		return anEvent
	}
	
	static func getEventAt(Index: Int) -> Event{
		return list[Index]
	}
	
	
}
