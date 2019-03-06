//
//  NewTripViewController.swift
//  Alpacka
//
//  Created by André Arko on 3/2/19.
//  Copyright © 2019 Cuti.es. All rights reserved.
//

import UIKit

class TripEditViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nameField?.delegate = self
        self.destinationField?.delegate = self
    }

    @IBOutlet var nameField : UITextField?
    @IBOutlet var destinationField : UITextField?
    @IBOutlet var fromDatePicker : UIDatePicker?
    @IBOutlet var untilDatePicker : UIDatePicker?
    @IBOutlet weak var saveButton: UIBarButtonItem!

    var trip : Trip? {
        guard !(nameField?.text?.isEmpty ?? true) else { return nil }
        guard !(destinationField?.text?.isEmpty ?? true) else { return nil }

        return Trip(
            name: nameField!.text!,
            destination: destinationField!.text!,
            fromDate: fromDatePicker!.date,
            untilDate: untilDatePicker!.date
        )
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        super.prepare(for: segue, sender: sender)
    //
    //        // Get the new view controller using segue.destination.
    //        // Pass the selected object to the new view controller.
    //    }

    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - UITextFieldDelegate

    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }

    // MARK: - Private

    private func updateSaveButtonState() {
        saveButton.isEnabled = (trip != nil)
    }

}
