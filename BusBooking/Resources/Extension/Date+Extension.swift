//
//  Date+Extension.swift
//  BusBooking
//
//  Created by Jose Augusto on 08/03/23.
//

import Foundation

extension Date {
    func getShortDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM, h:mm"
        let short = formatter.string(from: self)
        return short
    }
    
    func getShortHour() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        let hourString = formatter.string(from: self)
        return hourString
    }
}
