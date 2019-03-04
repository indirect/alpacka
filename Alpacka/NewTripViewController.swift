//
//  NewTripViewController.swift
//  Alpacka
//
//  Created by André Arko on 3/2/19.
//  Copyright © 2019 Cuti.es. All rights reserved.
//

import UIKit

class NewTripViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet var nameField : UITextField?
    @IBOutlet var destinationField : UITextField?
    @IBOutlet var fromDatePicker : UIDatePicker?
    @IBOutlet var untilDatePicker : UIDatePicker?

    // TODO: replace this with an unwind() on TripsTableViewController
    @IBAction func dismiss(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func done(_ sender: Any) {
        Storage.shared.addTrip(
            Trip(
                name: nameField!.text!,
                destination: destinationField!.text!,
                fromDate: fromDatePicker!.date,
                untilDate: untilDatePicker!.date
            )
        )
        dismiss(sender)
    }

}
