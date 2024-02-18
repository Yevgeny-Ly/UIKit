// DetailsShoesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol DetailsShoesViewControllerDelegate: AnyObject {
    func sendInfo(_ from: DetailsShoesViewController, product: Product)
}

/// Описывает детальный экран, где есть выбор обуви из категории
final class DetailsShoesViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let titleShoes = "Обувь"
        static let pictureShoesOpenToe = "shoesOpenToe"
        static let pictureBoots = "boots"
        static let pictureSneakersRed = "sneakersRed"
        static let pictureShoesScarpin = "shoesScarpin"
        static let pictureConverse = "converse"
        static let customButtonImage = "arrow"
    }

    // MARK: - Visual Components

    lazy var shoesOpenToeImageView: ProductCardView = {
        let imageView = ProductCardView()
        imageView.productImage = Constants.pictureShoesOpenToe
        imageView.delegate = self
        imageView.price = 2250
        return imageView
    }()

    lazy var bootsImageView: ProductCardView = {
        let imageView = ProductCardView()
        imageView.productImage = Constants.pictureBoots
        imageView.delegate = self
        imageView.price = 4250
        return imageView
    }()

    lazy var sneakersImageView: ProductCardView = {
        let imageView = ProductCardView()
        imageView.productImage = Constants.pictureSneakersRed
        imageView.delegate = self
        imageView.price = 5750
        return imageView
    }()

    lazy var shoesScarpinImageView: ProductCardView = {
        let imageView = ProductCardView()
        imageView.productImage = Constants.pictureShoesScarpin
        imageView.delegate = self
        imageView.price = 3500
        return imageView
    }()

    lazy var converseImageView: ProductCardView = {
        let imageView = ProductCardView()
        imageView.productImage = Constants.pictureConverse
        imageView.price = 5750
        imageView.delegate = self
        return imageView
    }()

    // MARK: - Public Properties

    weak var delegate: DetailsShoesViewControllerDelegate?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupBarButtonItem()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupViews()
    }

    // MARK: - Private Methods

    private func addSubviews() {
        for item in [
            shoesOpenToeImageView,
            bootsImageView,
            sneakersImageView,
            shoesScarpinImageView,
            converseImageView,
        ] {
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
    }

    private func setupViews() {
        shoesOpenToeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        shoesOpenToeImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        bootsImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        bootsImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true

        sneakersImageView.topAnchor.constraint(equalTo: shoesOpenToeImageView.bottomAnchor, constant: 20)
            .isActive = true
        sneakersImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        shoesScarpinImageView.topAnchor.constraint(equalTo: bootsImageView.bottomAnchor, constant: 20).isActive = true
        shoesScarpinImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true

        converseImageView.topAnchor.constraint(equalTo: sneakersImageView.bottomAnchor, constant: 20).isActive = true
        converseImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
    }

    private func setupBarButtonItem() {
        title = Constants.titleShoes
        navigationController?.setToolbarItems([], animated: false)

        let customButtonImage = UIImage(named: Constants.customButtonImage)?.withRenderingMode(.alwaysOriginal)
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

extension DetailsShoesViewController: ProductCardViewDelegate {
    func respondToCartButtonPress(_ productCardView: ProductCardView, product: Product) {
        delegate?.sendInfo(self, product: product)
        let sizeSelectionViewController = SizeSelectionViewController()
        sizeSelectionViewController.modalPresentationStyle = .automatic
        present(sizeSelectionViewController, animated: true)
    }
}
