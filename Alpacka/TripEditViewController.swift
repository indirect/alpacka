//
//  NewTripViewController.swift
//  Alpacka
//
//  Created by André Arko on 3/2/19.
//  Copyright © 2019 Cuti.es. All rights reserved.
//

import UIKit
import os

class TripEditViewController: UIViewController, UITextFieldDelegate {
    var trip : Trip?
    var newTrip = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get notified when text fields are edited
        self.nameField?.delegate = self
        self.destinationField?.delegate = self

        // If we have a trip, use those values
        if let trip = trip {
            nameField!.text = trip.name
            destinationField!.text = trip.destination
            fromDatePicker!.date = trip.fromDate
            untilDatePicker!.date = trip.untilDate
        // If we don't have a trip, make one
        } else {
            newTrip = true
            trip = Trip()
        }

        // Make sure the button is usable
        updateSaveButtonState()
    }

    @IBOutlet var nameField : UITextField?
    @IBOutlet var destinationField : UITextField?
    @IBOutlet var fromDatePicker : UIDatePicker?
    @IBOutlet var untilDatePicker : UIDatePicker?
    @IBOutlet weak var saveButton: UIBarButtonItem!

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        // Update trip model to match fields only if saving
        if (sender as? UIBarButtonItem === saveButton) {
            updateTrip()
        }
    }

    @IBAction func dismiss(sender: Any?) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func finishEditing(sender: Any?) {
        updateTrip()
        dismiss(sender: sender)
    }

    // MARK: - UITextFieldDelegate

    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }

    // MARK: - Private

    private func updateTrip() {
        debugPrint("updateTrip()")

        if var trip = trip {
            trip.name = nameField!.text!
            trip.destination = destinationField!.text!
            trip.fromDate = fromDatePicker!.date
            trip.untilDate = untilDatePicker!.date
        }
    }

    private func tripValid() -> Bool {
        guard !(nameField?.text?.isEmpty ?? true) else { return false }
        guard !(destinationField?.text?.isEmpty ?? true) else { return false }
        return true
    }

    private func updateSaveButtonState() {
        saveButton.isEnabled = tripValid()
    }

}
