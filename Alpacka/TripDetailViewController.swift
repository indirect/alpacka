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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nav = segue.destination as? UINavigationController,
            let editvc = nav.visibleViewController as? TripEditViewController {
            editvc.trip = self.trip
        }
    }

}
