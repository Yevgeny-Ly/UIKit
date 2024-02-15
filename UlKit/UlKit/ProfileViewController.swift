// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля юзера
final class ProfileViewController: UIViewController {
    enum Constants {
        static let screenTitle = "Профиль"
        static let discountCardPadding = (x: 20.0, y: 25.0)
    }

    private let discountCardView = DiscountCardView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        title = Constants.screenTitle
        view.addSubview(discountCardView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            discountCardView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.discountCardPadding.y
            ),
            discountCardView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.discountCardPadding.x
            ),
            view.trailingAnchor.constraint(
                equalTo: discountCardView.trailingAnchor,
                constant: Constants.discountCardPadding.x
            )
        ])
    }
}
