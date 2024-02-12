// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "logoCofeinov")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .specialdarkBrown
    }
}
