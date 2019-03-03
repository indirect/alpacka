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

    @IBAction func dismiss(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func done(_ sender: Any) {
        Storage.shared.trips.append(
            Trip(name: nameField?.text ?? "", destination: destinationField?.text ?? "")
        )
        dismiss(sender)
    }

}
