//
//  DateFormat.swift
//  Strandparken
//
//  Created by Tina Thomsen on 31/05/2020.
//  Copyright © 2020 Tina Thomsen. All rights reserved.
//

import Foundation
import Firebase

class DateFormat {
	
	static func dateFormatter(Date: Date)-> String{
		let format = DateFormatter()
		format.dateFormat = "yyyy-MM-dd HH:mm"
		let formattedDate = format.string(from: Date)
		return formattedDate
	}
	
	static func dkDateFormat(Date: Date)->String{
		let format = DateFormatter()
		format.dateFormat = "dd/MM/yyyy"
		let formattedDate = format.string(from: Date)
		return formattedDate
	}
	
	static func getTime(Time: Date)->String{
		let format = DateFormatter()
		format.dateFormat = "HH:mm"
		let formattedTime = format.string(from: Time)
		return formattedTime
	}
	
	static func getYear(Date: Date) -> String{
		let format = DateFormatter()
		format.dateFormat = "yyyy"
		let formattedDate = format.string(from: Date)
		return formattedDate
	}
	
	static func getMonth(Date: Date) -> String{
		let format = DateFormatter()
		format.dateFormat = "MM"
		let formattedDate = format.string(from: Date)
		return formattedDate
	}
	
	static func convertMonth(Date: String)->String{
		let monthNameList = ["Januar", "Februar", "Marts", "April", "Maj", "Juni", "Juli", "August", "September", "Oktober", "November", "December"]
		let monthNumberList = ["01", "02","03", "04","05", "06","07", "08","09", "10","11", "12", ]
		
		let dict = Dictionary(uniqueKeysWithValues: zip(monthNameList, monthNumberList))
		
		let number = dict[Date]
		
		return number!
	}
	
	static func slizeDate(data: String)-> String{
		let dateSliced = data.components(separatedBy: " ")
		
		let mm = dateSliced[1]
		let formatMM = convertMonth(Date: mm) //from ie Juni to 06
		let dd = dateSliced[0] //ie 2
		
		let zeroCheck = zeroBefore(number: dd)
		let finalStr = zeroCheck + "/" + formatMM + "/" + dateSliced[2]
		
		print(finalStr)
		return finalStr
		
		
	}
	
	static func zeroBefore(number: String)-> String{
		var intNumber = Int(number)

		if intNumber! < 10{
			var aNewNo = "0\(number)"
			return aNewNo
		}
		return number
	}
	
}
