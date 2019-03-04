//
//  Trip.swift
//  Alpacka
//
//  Created by André Arko on 3/1/19.
//  Copyright © 2019 Cuti.es. All rights reserved.
//

import Foundation

struct Trip : Codable {

    var name: String
    var destination: String

    init(name: String, destination: String) {
        self.name = name
        self.destination = destination
    }

}
