// CartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class CartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CartViewController: DetailsShoesViewControllerDelegate {
    func sendInfo(_ from: DetailsShoesViewController, product: Product) {
        print(product)
        print("респечатай его цену и покажи картинку")
    }
}
