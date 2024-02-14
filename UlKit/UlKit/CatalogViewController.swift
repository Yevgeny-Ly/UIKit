// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class CatalogViewController: UIViewController {
    var categories = ["Женщинам", "Мужчинам", "Детям"]

    private lazy var categoriesSegmentControl: UISegmentedControl = {
        let segmentControl = UISegmentedControl(items: self.categories)
        segmentControl.selectedSegmentIndex = 0
        return segmentControl
    }()

    private var manShoesImageView = UIImageView(image: .womanShoes)

    private var manSneakersImageView = UIImageView(image: .sandalsWoman)

    private lazy var brendsButton: UIButton = createButton(title: "Бренды", imageName: "brends")

    private lazy var shoesManButton: UIButton = createButton(
        title: "Обувь",
        imageName: "shoesWoman",
        action: #selector(goToShoesWomanDetails)
    )

    private lazy var bagManButton: UIButton = createButton(title: "Сумки", imageName: "bagWoman")

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupBarButtonItem()
        configElementsButton()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }

    private func addSubviews() {
        view.backgroundColor = .white
        for item in [
            categoriesSegmentControl,
            manShoesImageView,
            manSneakersImageView,
            brendsButton,
            shoesManButton,
            bagManButton
        ] {
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
    }

    private func setupViews() {
        categoriesSegmentControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        categoriesSegmentControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        categoriesSegmentControl.heightAnchor.constraint(equalToConstant: 44).isActive = true
        categoriesSegmentControl.widthAnchor.constraint(equalToConstant: 345).isActive = true

        manShoesImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        manShoesImageView.topAnchor.constraint(equalTo: categoriesSegmentControl.bottomAnchor, constant: 20)
            .isActive = true

        manSneakersImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        manSneakersImageView.topAnchor.constraint(equalTo: categoriesSegmentControl.bottomAnchor, constant: 20)
            .isActive = true

        brendsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        brendsButton.topAnchor.constraint(equalTo: manSneakersImageView.bottomAnchor, constant: 15).isActive = true
        brendsButton.widthAnchor.constraint(equalToConstant: 345).isActive = true
        brendsButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

        shoesManButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        shoesManButton.topAnchor.constraint(equalTo: brendsButton.bottomAnchor, constant: 15).isActive = true
        shoesManButton.widthAnchor.constraint(equalToConstant: 345).isActive = true
        shoesManButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

        bagManButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        bagManButton.topAnchor.constraint(equalTo: shoesManButton.bottomAnchor, constant: 15).isActive = true
        bagManButton.widthAnchor.constraint(equalToConstant: 345).isActive = true
        bagManButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupBarButtonItem() {
        title = "Каталог"
        let cameraLogo = UIBarButtonItem(
            image: UIImage(systemName: "camera"),
            style: .plain,
            target: self,
            action: #selector(selectCamera)
        )
        let barcodeLogo = UIBarButtonItem(
            image: UIImage(systemName: "barcode.viewfinder"),
            style: .plain,
            target: self,
            action: #selector(selectBarcode)
        )
        navigationItem.rightBarButtonItems = [cameraLogo, barcodeLogo]

        [cameraLogo, barcodeLogo].forEach { $0.tintColor = .black }
    }

    private func createButton(title: String, imageName: String, action: Selector? = nil) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .grayLight
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 14)
        button.setImage(UIImage(named: imageName), for: .normal)
        if let action = action {
            button.addTarget(self, action: action, for: .touchUpInside)
        }
        return button
    }

    private func configElementsButton() {
        brendsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -340, bottom: 0, right: -10)
        brendsButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 245, bottom: 0, right: 10)

        shoesManButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -345, bottom: 0, right: -10)
        shoesManButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 245, bottom: 0, right: 10)

        bagManButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -345, bottom: 0, right: -10)
        bagManButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 245, bottom: 0, right: 10)
    }

    @objc
    private func selectCamera() {}

    @objc
    private func selectBarcode() {}

    @objc
    private func goToShoesWomanDetails() {
        let detailsShoesViewController = DetailsShoesViewController()
        navigationController?.pushViewController(detailsShoesViewController, animated: true)
    }
}
