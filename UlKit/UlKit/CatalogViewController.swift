// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Описывает все товары, которые находятся в каталоге
final class CatalogViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let categoryWomen = "Женщинам"
        static let categoryMen = "Мужчинам"
        static let categoryChildren = "Детям"

        static let blockBrands = "brands"
        static let blockBags = "bags"
        static let blockShoes = "shoes"

        static let titleCatalog = "Каталог"
    }

    // MARK: - Private Properties

    private let categories = [Constants.categoryWomen, Constants.categoryMen, Constants.categoryChildren]

    // MARK: - Visual Components

    private lazy var categoriesSegmentedControl = UISegmentedControl(items: self.categories)

    private lazy var shadowShoesView = createShadowView()

    private lazy var shadowSneakersView = createShadowView()

    private lazy var shoesImageView: UIImageView = createImageView(image: .womanShoes)

    private lazy var sneakersImageView: UIImageView = createImageView(image: .sandalsWoman)

    private lazy var brandsButton: UIButton = createButton(
        title: Constants.blockBrands, image: .brends
    )

    private lazy var bagButton: UIButton = createButton(title: Constants.blockBags, image: .bagWoman)

    private lazy var shoesButton: UIButton = createButton(
        title: Constants.blockShoes,
        image: .shoesWoman,
        action: #selector(goToShoesWomanDetails)
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupBarButtonItem()
        configureElementsButton()
        configSegmentControl()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        shadowShoesView.addSubview(shoesImageView)
        shadowSneakersView.addSubview(sneakersImageView)
        view.backgroundColor = .white
        for item in [
            categoriesSegmentedControl,
            shadowShoesView,
            shadowSneakersView,
            brandsButton,
            shoesButton,
            bagButton
        ] {
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
    }

    // MARK: - Private Methods

    private func setupConstraints() {
        categoriesSegmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        categoriesSegmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        categoriesSegmentedControl.heightAnchor.constraint(equalToConstant: 44).isActive = true
        categoriesSegmentedControl.widthAnchor.constraint(equalToConstant: 345).isActive = true

        shadowShoesView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        shadowShoesView.topAnchor.constraint(equalTo: categoriesSegmentedControl.bottomAnchor, constant: 20)
            .isActive = true
        shadowShoesView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        shadowShoesView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        shoesImageView.leftAnchor.constraint(equalTo: shadowShoesView.leftAnchor).isActive = true
        shoesImageView.rightAnchor.constraint(equalTo: shadowShoesView.rightAnchor).isActive = true
        shoesImageView.topAnchor.constraint(equalTo: shadowShoesView.topAnchor).isActive = true
        shoesImageView.bottomAnchor.constraint(equalTo: shadowShoesView.bottomAnchor).isActive = true

        shadowSneakersView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        shadowSneakersView.topAnchor.constraint(equalTo: categoriesSegmentedControl.bottomAnchor, constant: 20)
            .isActive = true
        shadowSneakersView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        shadowSneakersView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        sneakersImageView.leftAnchor.constraint(equalTo: shadowSneakersView.leftAnchor).isActive = true
        sneakersImageView.rightAnchor.constraint(equalTo: shadowSneakersView.rightAnchor).isActive = true
        sneakersImageView.topAnchor.constraint(equalTo: shadowSneakersView.topAnchor)
            .isActive = true
        sneakersImageView.bottomAnchor.constraint(equalTo: shadowSneakersView.bottomAnchor).isActive = true

        brandsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        brandsButton.topAnchor.constraint(equalTo: sneakersImageView.bottomAnchor, constant: 15).isActive = true
        brandsButton.widthAnchor.constraint(equalToConstant: 345).isActive = true
        brandsButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

        shoesButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        shoesButton.topAnchor.constraint(equalTo: brandsButton.bottomAnchor, constant: 15).isActive = true
        shoesButton.widthAnchor.constraint(equalToConstant: 345).isActive = true
        shoesButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

        bagButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        bagButton.topAnchor.constraint(equalTo: shoesButton.bottomAnchor, constant: 15).isActive = true
        bagButton.widthAnchor.constraint(equalToConstant: 345).isActive = true
        bagButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupBarButtonItem() {
        title = Constants.titleCatalog
        let cameraLogo = UIBarButtonItem(
            image: UIImage(systemName: "camera"),
            style: .plain,
            target: self,
            action: #selector(callsCamera)
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

    private func createButton(title: String, image: UIImage, action: Selector? = nil) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .grayLight
        button.titleLabel?.font = .verdanaBold(ofSize: 14)
        button.setImage(image, for: .normal)
        if let action {
            button.addTarget(self, action: action, for: .touchUpInside)
        }
        return button
    }

    private func createShadowView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = .init(width: 0, height: 5)
        view.layer.shadowRadius = 4
        view.contentMode = .scaleAspectFit
        return view
    }

    private func createImageView(image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    private func configureElementsButton() {
        brandsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -340, bottom: 0, right: -10)
        brandsButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 245, bottom: 0, right: 10)

        shoesButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -345, bottom: 0, right: -10)
        shoesButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 245, bottom: 0, right: 10)

        bagButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -345, bottom: 0, right: -10)
        bagButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 245, bottom: 0, right: 10)
    }

    private func configSegmentControl() {
        categoriesSegmentedControl.selectedSegmentIndex = 0
        categoriesSegmentedControl.addTarget(self, action: #selector(reactsToSwitches), for: .valueChanged)
    }

    @objc
    private func callsCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }

    @objc
    private func selectBarcode() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }

    @objc
    private func reactsToSwitches() {
        switch categoriesSegmentedControl.selectedSegmentIndex {
        case 0:
            shoesImageView.image = .womanShoes
            sneakersImageView.image = .sandalsWoman
            shoesButton.setImage(.shoesWoman, for: .normal)
            bagButton.setImage(.bagWoman, for: .normal)
        case 1:
            shoesImageView.image = .manShoes
            sneakersImageView.image = .manSneakers
            shoesButton.setImage(.shoesMan, for: .normal)
            bagButton.setImage(.bagMan, for: .normal)
        case 2:
            shoesImageView.image = .kidsSneakers
            sneakersImageView.image = .babySneakers
            shoesButton.setImage(.childrensSneakers, for: .normal)
            bagButton.setImage(.babyBackpack, for: .normal)
        default:
            break
        }
    }

    @objc
    private func goToShoesWomanDetails() {
        let detailsShoesViewController = DetailsShoesViewController()

        guard let cartViewController = (
            navigationController?.tabBarController?
                .viewControllers?[1] as? UINavigationController
        )?.viewControllers[0] as? CartViewController else { return }

        detailsShoesViewController.delegate = cartViewController
        navigationController?.pushViewController(detailsShoesViewController, animated: true)
    }
}

/// настройка выбора и обработки изображения из камеры
extension CatalogViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
}
