// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Описывает детальный экран чека покупателя
final class CheckViewController: UIViewController {
    // MARK: - IBOutlet

    @IBOutlet var firstCheckItemLabel: UILabel!
    @IBOutlet var firstDishDescription: UILabel!
    @IBOutlet var firstMealPriceLabel: UILabel!
    @IBOutlet var firstArrow: UIImageView!
    @IBOutlet var firstLineView: UIView!
    @IBOutlet var secondCheckItemLabel: UILabel!
    @IBOutlet var secondDishDescription: UILabel!
    @IBOutlet var secondMealPriceLabel: UILabel!
    @IBOutlet var secondArrow: UIImageView!
    @IBOutlet var secondLineView: UIView!
    @IBOutlet var imageCheckView: UIImageView!
    @IBOutlet var finalButton: UIButton!

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        adjustsFrame()
    }

    private func adjustsFrame() {
        firstCheckItemLabel.frame = CGRect(x: 20, y: 110, width: 175, height: 19)
        firstDishDescription.frame = CGRect(x: 20, y: 139, width: 293, height: 34)
        firstMealPriceLabel.frame = CGRect(x: 265, y: 110, width: 50, height: 19)
        firstArrow.frame = CGRect(x: 340, y: 110, width: 19, height: 19)
        firstLineView.frame = CGRect(x: 20, y: 179, width: 335, height: 1)
        secondCheckItemLabel.frame = CGRect(x: 20, y: 209, width: 175, height: 19)
        secondDishDescription.frame = CGRect(x: 20, y: 238, width: 293, height: 34)
        secondMealPriceLabel.frame = CGRect(x: 265, y: 209, width: 50, height: 19)
        secondArrow.frame = CGRect(x: 340, y: 210, width: 19, height: 19)
        secondLineView.frame = CGRect(x: 20, y: 278, width: 335, height: 1)
        imageCheckView.frame = CGRect(x: 20, y: 290, width: 335, height: 280)
        finalButton.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
    }
}
