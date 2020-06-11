import Foundation
import FirebaseAuth
import FirebaseFirestore

class PinHandler{
	static var list = [Pin]()
	static let DB = Firestore.firestore()
	
	static func CreatePin(headline: String, descript: String, date: String, userID: String)-> Pin{
		var map = [String: String]()
		map["Headline"] = headline
		map["Description"] = descript
		map["Date"] = date
		map["User"] = userID
	
		let docadd = DB.collection("Pin").addDocument(data: map)
		let newPin = Pin(id: docadd.documentID, headline: headline, description: descript, date: date, Uid: userID )
		list.append(newPin)
		return newPin
	}
	
	static func ListenforPins(collectionView: UICollectionView){
		let userUID = UserHandler.getCurrentUID()
		
		print("Listening for Pin")
		DB.collection("Pin").addSnapshotListener { (snap, error) in
			if error == nil{
				self.list.removeAll() //Avoid duplicates
				for pin in snap!.documents{
					let map = pin.data()
					let headline = map["Headline"] as! String
					let description = map["Description"] as! String
					let date = map["Date"] as! String
					let userid = map["User"] as! String
					
					let readPin = Pin(id: pin.documentID, headline: headline, description: description, date: date, Uid: userUID)
					list.append(readPin)
					print("List of Pin, read from ListeningforPins \(list)")
				}
				DispatchQueue.main.async{
					collectionView.reloadData()
				}
			}
		}
	}
	
	static func checkIfAuthor(docid: String, uid: String){
		let docref = DB.collection("Pin").document()
	}
	
	static func UpdatePin(index: Int, headline: String, description: String, date: String, uid: String){
		let pin = list[index]
		
		let docRef = DB.collection("Pin").document(pin.id)
		var map = [String: String]()
		map["Headline"] = headline
		map["Description"] = description
		map["Date"] = date
		map["User"] = uid
		docRef.setData(map)
	}
	
	static func DeletePin(id: String){
		let docref = DB.collection("Pin").document(id)
		docref.delete()
	}
	
	static func getSize() -> Int{
		return list.count
	}
	
	static func getPinAt(Index: Int) -> Pin{
		return list[Index]
	}
	
}
