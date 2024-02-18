// DiscountCardView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Скидочная карта
final class DiscountCardView: UIView {
    // MARK: - Constants

    enum Constants {
        static let offset = CGSize(width: 0, height: 4)
        static let opacity = Float(1.0)
        static let radius = 10.0

        static let cardRatio = 0.537
        static let cardCornerRaius = 20.0
        static let logoPadding = (x: 8.0, y: 16.0)
        static let logoMaxSize = 80.0
        static let qrCodeButtonPadding = (x: 13.0, y: 13.0)
        static let infoButtonPadding = (x: 14.0, y: 20.0)
        static let iconButtonSize = 30.0
        static let discountValuePadding = (x: 14.0, y: 7.0)
        static let cardNumberPadding = (x: 14.0, y: 21.0)

        static let discountValueText = "15%"
        static let cardNumberText = "1000 0001 0102"
    }

    // MARK: - Visual Components

    private lazy var logoView: UIImageView = {
        let view = UIImageView(image: .logo)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var discountValueLabel: UILabel = {
        let label = UILabel()
        label.font = .verdanaBold(ofSize: 16)
        label.text = Constants.discountValueText
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var cardNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .verdana(ofSize: 14)
        label.text = Constants.cardNumberText
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var qrCodeButton = makeIconButton(icon: .qrCodeIcon)
    private lazy var infoButton = makeIconButton(icon: .infoIcon)

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Private Methods

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .blackMain
        layer.cornerRadius = Constants.cardCornerRaius
        layer.shadowColor = UIColor.grayShadow.cgColor
        layer.shadowOffset = Constants.offset
        layer.shadowRadius = Constants.radius
        layer.shadowOpacity = Constants.opacity

        addSubview(logoView)
        addSubview(qrCodeButton)
        addSubview(infoButton)
        addSubview(discountValueLabel)
        addSubview(cardNumberLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        [
            heightAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.cardRatio),
            logoView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.logoPadding.y),
            logoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.logoPadding.x),
            logoView.heightAnchor.constraint(lessThanOrEqualToConstant: Constants.logoMaxSize),
            logoView.widthAnchor.constraint(equalTo: logoView.heightAnchor),
            qrCodeButton.topAnchor.constraint(equalTo: topAnchor, constant: Constants.qrCodeButtonPadding.y),
            trailingAnchor.constraint(equalTo: qrCodeButton.trailingAnchor, constant: Constants.qrCodeButtonPadding.x),
            qrCodeButton.widthAnchor.constraint(equalToConstant: Constants.iconButtonSize),
            qrCodeButton.heightAnchor.constraint(equalTo: qrCodeButton.widthAnchor),
            trailingAnchor.constraint(equalTo: infoButton.trailingAnchor, constant: Constants.infoButtonPadding.x),
            bottomAnchor.constraint(equalTo: infoButton.bottomAnchor, constant: Constants.infoButtonPadding.y),
            infoButton.widthAnchor.constraint(equalToConstant: Constants.iconButtonSize),
            infoButton.heightAnchor.constraint(equalTo: infoButton.widthAnchor),
            discountValueLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constants.discountValuePadding.x
            ),
            cardNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.cardNumberPadding.x),
            cardNumberLabel.topAnchor.constraint(
                equalTo: discountValueLabel.bottomAnchor,
                constant: Constants.discountValuePadding.y
            ),
            bottomAnchor.constraint(equalTo: cardNumberLabel.bottomAnchor, constant: Constants.cardNumberPadding.y)
        ].forEach { $0.isActive = true }
    }

    private func makeIconButton(icon: UIImage) -> UIButton {
        let button = UIButton(configuration: .filled())
        button.configuration?.image = icon
        button.configuration?.baseBackgroundColor = .white01
        button.configuration?.baseForegroundColor = .white
        button.configuration?.cornerStyle = .capsule
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
