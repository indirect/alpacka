//
//  Storage.swift
//  Alpacka
//
//  Created by André Arko on 3/2/19.
//  Copyright © 2019 Cuti.es. All rights reserved.
//

import Foundation

class Storage {
    static let shared = Storage(fileURL: sharedStoragePath!)

    static var sharedStoragePath: URL? {
        get {
            do {
                return try FileManager.default.url(
                    for:.documentDirectory,
                    in: .userDomainMask,
                    appropriateFor: nil,
                    create: false
                ).appendingPathComponent("Storage.plist")
            } catch {
                return nil
            }
        }
    }

    var fileURL : URL
    var trips = [Trip]()

    init(fileURL givenURL: URL) {
        fileURL = givenURL
    }

    func addTrip(_ trip: Trip) {
        trips.append(trip)
    }

    func deleteTripAt(_ index: Int) {
        trips.remove(at: index)
    }

    func defaultTrips() -> [Trip] {
        return [
            Trip(name: "HawaiiJS", destination: "Honolulu, HI",
                 fromDate: Date(timeIntervalSinceNow: 0),
                 untilDate: Date(timeIntervalSinceNow: (60*60*24*5))),
            Trip(name: "BangBangCon West", destination: "Santa Cruz, CA",
                 fromDate: Date(timeIntervalSinceNow: 0),
                 untilDate: Date(timeIntervalSinceNow: (60*60*24*5))),
            Trip(name: "Indonesian Vacation", destination: "Jakarta, Indonesia",
                 fromDate: Date(timeIntervalSinceNow: 0),
                 untilDate: Date(timeIntervalSinceNow: (60*60*24*5))),
        ]
    }

    func save() {
        do {
            let encoded = try PropertyListEncoder().encode(trips)
            try encoded.write(to: fileURL, options: .atomic)
        } catch {
            print("Oh no, couldn't save to \(self.fileURL)")
        }
    }

    func load() {
        do {
            let tripsData = try Data(contentsOf: fileURL)
            trips = try PropertyListDecoder().decode([Trip].self, from: tripsData)
        } catch {
            print("Couldn't load from \(self.fileURL)")
            trips = defaultTrips()
        }
    }
}
