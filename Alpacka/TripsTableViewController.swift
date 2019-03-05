//
//  TripsTableViewController.swift
//  Alpacka
//
//  Created by André Arko on 3/1/19.
//  Copyright © 2019 Cuti.es. All rights reserved.
//

import UIKit

class TripsTableViewController: UITableViewController {
    let reuseIdentifier = "tripReuseIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

        // Enable large nav bar titles
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    var dateFormatter : DateFormatter {
        let df = DateFormatter()
        df.timeStyle = .none
        df.setLocalizedDateFormatFromTemplate("MMMM d")
        return df
    }

    var lengthFormatter : DateComponentsFormatter {
        let dcf = DateComponentsFormatter()
        dcf.unitsStyle = .full
        dcf.allowedUnits = [.day]
        return dcf
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.shared.trips.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TripsTableViewCell

        let trip = Storage.shared.trips[indexPath.row]
        cell.nameLabel!.text = trip.name
        cell.destinationLabel!.text = trip.destination

        let from = dateFormatter.string(from: trip.fromDate)
        cell.datesLabel!.text = from

        let length = trip.untilDate.timeIntervalSince(trip.fromDate)
        cell.durationLabel!.text = lengthFormatter.string(from: length)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != .delete { return }

        // Delete the row from the data source
        Storage.shared.deleteTripAt(indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
