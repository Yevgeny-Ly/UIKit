// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Описывает детальный экран кафе
final class ProfileViewController: UIViewController {
    // MARK: - IBOutlet

    @IBOutlet var initialsUserLabel: UILabel!
    @IBOutlet var inputInitialsTextField: UITextField!
    @IBOutlet var firstLineView: UIView!
    @IBOutlet var numberGuests: UILabel!
    @IBOutlet var indicatesNumberGuestsTextField: UITextField!
    @IBOutlet var secondLineView: UIView!
    @IBOutlet var tableNumberLabel: UILabel!
    @IBOutlet var tableNumberTextField: UITextField!
    @IBOutlet var thirdLineView: UIView!
    @IBOutlet var reservationLabel: UILabel!
    @IBOutlet var prepaymentLabel: UILabel!
    @IBOutlet var vipRoomLabel: UILabel!
    @IBOutlet var invoiceButton: UIButton!
    @IBOutlet var reservationSwitch: UISwitch!
    @IBOutlet var prepaymentSwitch: UISwitch!
    @IBOutlet var vipRoomSwitch: UISwitch!

    // MARK: - Life Cycle

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        adjustsFrame()
    }

    // MARK: - Private Methods

    private func adjustsFrame() {
        initialsUserLabel.frame = CGRect(x: 20, y: 110, width: 175, height: 19)
        inputInitialsTextField.frame = CGRect(x: 20, y: 139, width: 250, height: 17)
        firstLineView.frame = CGRect(x: 20, y: 164, width: 335, height: 1)
        numberGuests.frame = CGRect(x: 20, y: 181, width: 175, height: 19)
        indicatesNumberGuestsTextField.frame = CGRect(x: 20, y: 210, width: 250, height: 17)
        secondLineView.frame = CGRect(x: 20, y: 235, width: 335, height: 1)
        tableNumberLabel.frame = CGRect(x: 20, y: 252, width: 175, height: 19)
        tableNumberTextField.frame = CGRect(x: 20, y: 281, width: 250, height: 17)
        thirdLineView.frame = CGRect(x: 20, y: 306, width: 335, height: 1)
        reservationLabel.frame = CGRect(x: 20, y: 385, width: 250, height: 35)
        prepaymentLabel.frame = CGRect(x: 20, y: 444, width: 250, height: 35)
        vipRoomLabel.frame = CGRect(x: 20, y: 501, width: 250, height: 35)
        invoiceButton.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        reservationSwitch.frame = CGRect(x: 305, y: 385, width: 31, height: 31)
        prepaymentSwitch.frame = CGRect(x: 305, y: 442, width: 31, height: 31)
        vipRoomSwitch.frame = CGRect(x: 305, y: 503, width: 31, height: 31)
    }

    @IBAction private func showСheckAlertAction(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Выставить счет?", message: nil, preferredStyle: .alert)
        let check = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: "checkViewController", sender: nil)
        }
        let abolition = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

        alertController.addAction(check)
        alertController.addAction(abolition)

        present(alertController, animated: true)
    }
}
