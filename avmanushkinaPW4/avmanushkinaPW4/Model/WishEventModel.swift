//
//  WishEventModel.swift
//  avmanushkinaPW4
//
//  Created by Анастасия on 05.02.2024.
//

import UIKit

class WishEventModel: Codable {
    var title: String
    var description: String
    var startDate: Date
    var endDate: Date
    
    init(title: String, description: String, startDate: Date, endDate: Date) {
        self.title = title
        self.description = description
        self.startDate = startDate
        self.endDate = endDate
    }
}
