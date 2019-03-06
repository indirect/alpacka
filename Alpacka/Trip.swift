//
//  Trip.swift
//  Alpacka
//
//  Created by André Arko on 3/1/19.
//  Copyright © 2019 Cuti.es. All rights reserved.
//

import Foundation

struct Item : Codable {
    var name: String
    var packed: Bool
}

struct Trip : Codable {
    var name: String
    var destination: String
    var fromDate: Date
    var untilDate: Date
    var list = [Item]()
}

// Extra init in structs overwrite the default init unless in an extension
extension Trip {
    // This init allows not passing a list, providing an empty list
    init(name: String, destination: String, fromDate: Date, untilDate: Date) {
        self.init(
            name: name,
            destination: destination,
            fromDate: fromDate,
            untilDate: untilDate,
            list: [Item]()
        )
    }

    // This init creates an empty trip
    init() {
        self.init(name: "", destination: "", fromDate: Date(), untilDate: Date(), list: [Item]())
    }
}

