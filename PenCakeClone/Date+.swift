//
//  Date+.swift
//  PenCakeClone
//
//  Created by Celan on 2023/03/18.
//

import Foundation

extension Date {
    public func formattedDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd"
        return dateFormatter.string(from: self)
    }
}
