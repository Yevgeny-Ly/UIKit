// DetailsShoesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class DetailsShoesViewController: UIViewController {
    private lazy var shoesOpenToe: UIImageView = createImageView(image: "shoesOpenToe")

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupBarButtonItem()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }

    private func addSubviews() {
        for item in [
            shoesOpenToe,
        ] {
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
    }

    private func setupViews() {}

    private func createImageView(image: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: image)
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .grayLight
        imageView.widthAnchor.constraint(equalToConstant: 157).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 157).isActive = true
        return imageView
    }

    private func setupBarButtonItem() {
        title = "Обувь"
        navigationController?.setToolbarItems([], animated: false)

        let customButtonImage = UIImage(named: "arrow")?.withRenderingMode(.alwaysOriginal)
        let customButton = UIBarButtonItem(
            image: customButtonImage,
            style: .plain,
            target: self,
            action: #selector(returnsToViewController)
        )
        navigationItem.leftBarButtonItem = customButton
    }

    @objc
    private func returnsToViewController() {
        navigationController?.popViewController(animated: true)
    }
}
