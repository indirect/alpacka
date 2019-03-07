//
//  TripViewController.swift
//  Alpacka
//
//  Created by André Arko on 3/5/19.
//  Copyright © 2019 Cuti.es. All rights reserved.
//

import UIKit

class TripDetailViewController: UIViewController {
    var trip : Trip?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = self.trip?.name ?? "Trip Detail"
    }
    

    // MARK: - Navigation

    @IBAction func unwindToTripDetail(sender: UIStoryboardSegue) {
        // Pull back any changes from the edit view
        if let editvc = sender.source as? TripEditViewController {
            self.trip = editvc.trip
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Give our trip to the edit view
        if let editvc = segue.destination as? TripEditViewController {
            editvc.trip = self.trip
        }
    }

}
