//
//  Storage.swift
//  Alpacka
//
//  Created by André Arko on 3/2/19.
//  Copyright © 2019 Cuti.es. All rights reserved.
//

import Foundation

class Storage {
    static let shared = Storage()

    var trips = [Trip]()

    init() {
        let sampleTrips = [
            Trip(name: "HawaiiJS", destination: "Honolulu, HI"),
            Trip(name: "BangBangCon West", destination: "Santa Cruz, CA"),
            Trip(name: "Indonesian Vacation", destination: "Jakarta, Indonesia")
        ]

        trips.append(contentsOf: sampleTrips)
    }
}
