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
    var fromDate: Date
    var untilDate: Date
}
