// CartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class CartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CartViewController: DetailsShoesViewControllerDelegate {
    func acceptInfo(_ from: DetailsShoesViewController, product: Product) {
        print(product)
        print("респечатай его цену и покажи картинку")
    }
}
