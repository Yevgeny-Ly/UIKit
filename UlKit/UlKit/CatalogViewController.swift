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

        static let fontVerdanaBold = "Verdana-Bold"
        static let titleCatalog = "Каталог"

        static let shoesNameImage = "womanShoes"
        static let sandalsNameImage = "sandalsWoman"
        static let brendsNameImage = "brends"
        static let bagNameImage = "bagWoman"
        static let shoesWomanNamePicture = "shoesWoman"

        static let manShoesNameImage = "manShoes"
        static let manSneakersNameImage = "manSneakers"
        static let shoesManNameImage = "shoesMan"
        static let bagManNameImage = "bagMan"

        static let kidsSneakersNameImage = "kidsSneakers"
        static let babySneakersNameImage = "babySneakers"
        static let childrensSneakersNameImage = "childrensSneakers"
        static let babyBackpackNameImage = "babyBackpack"
    }

    // MARK: - Private Properties

    private let categories = [Constants.categoryWomen, Constants.categoryMen, Constants.categoryChildren]

    // MARK: - Visual Components

    private lazy var categoriesSegmentedControl = UISegmentedControl(items: self.categories)

    private lazy var shadowShoesView = createShadowView()

    private lazy var shadowSneakersView = createShadowView()

    private lazy var shoesImageView: UIImageView = createImageView(nameImage: Constants.shoesNameImage)

    private lazy var sneakersImageView: UIImageView = createImageView(nameImage: Constants.sandalsNameImage)

    private lazy var brendsButton: UIButton = createButton(
        title: Constants.blockBrands,
        imageName: Constants.brendsNameImage
    )

    private lazy var bagButton: UIButton = createButton(title: Constants.blockBags, imageName: Constants.bagNameImage)

    private lazy var shoesButton: UIButton = createButton(
        title: Constants.blockShoes,
        imageName: Constants.shoesWomanNamePicture,
        action: #selector(goToShoesWomanDetails)
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupBarButtonItem()
        configElementsButton()
        configSegmentControl()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }

    private func addSubviews() {
        shadowShoesView.addSubview(shoesImageView)
        shadowSneakersView.addSubview(sneakersImageView)
        view.backgroundColor = .white
        for item in [
            categoriesSegmentedControl,
            shadowShoesView,
            shadowSneakersView,
            brendsButton,
            shoesButton,
            bagButton
        ] {
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
    }

    // MARK: - Private Methods

    private func setupViews() {
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

        brendsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        brendsButton.topAnchor.constraint(equalTo: sneakersImageView.bottomAnchor, constant: 15).isActive = true
        brendsButton.widthAnchor.constraint(equalToConstant: 345).isActive = true
        brendsButton.heightAnchor.constraint(equalToConstant: 80).isActive = true

        shoesButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        shoesButton.topAnchor.constraint(equalTo: brendsButton.bottomAnchor, constant: 15).isActive = true
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

    private func createButton(title: String, imageName: String, action: Selector? = nil) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .grayLight
        button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: 14)
        button.setImage(UIImage(named: imageName), for: .normal)
        if let action = action {
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

    private func createImageView(nameImage: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: nameImage)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    private func configElementsButton() {
        brendsButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -340, bottom: 0, right: -10)
        brendsButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 245, bottom: 0, right: 10)

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
            shoesImageView.image = UIImage(named: Constants.shoesNameImage)
            sneakersImageView.image = UIImage(named: Constants.sandalsNameImage)
            shoesButton.setImage(UIImage(named: Constants.shoesWomanNamePicture), for: .normal)
            bagButton.setImage(UIImage(named: Constants.bagNameImage), for: .normal)
        case 1:
            shoesImageView.image = UIImage(named: Constants.manShoesNameImage)
            sneakersImageView.image = UIImage(named: Constants.manSneakersNameImage)
            shoesButton.setImage(UIImage(named: Constants.shoesManNameImage), for: .normal)
            bagButton.setImage(UIImage(named: Constants.bagManNameImage), for: .normal)
        case 2:
            shoesImageView.image = UIImage(named: Constants.kidsSneakersNameImage)
            sneakersImageView.image = UIImage(named: Constants.babySneakersNameImage)
            shoesButton.setImage(UIImage(named: Constants.childrensSneakersNameImage), for: .normal)
            bagButton.setImage(UIImage(named: Constants.babyBackpackNameImage), for: .normal)
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
