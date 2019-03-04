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

    var trip : Trip {
        get {
            return Trip(
                name: nameField!.text!,
                destination: destinationField!.text!,
                fromDate: fromDatePicker!.date,
                untilDate: untilDatePicker!.date
            )
        }
    }

    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func done() {
        Storage.shared.addTrip(trip)
        dismiss(animated: true, completion: nil)
    }
}
