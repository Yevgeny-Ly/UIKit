// PrimaryButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главная кнопка
final class PrimaryButton: UIButton {
    enum Constants {
        static let height = 44.0
        static let shadowOffset = CGSize(width: 0, height: 4)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    private func setupButton() {
        translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.filled()
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .pinkMain
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer {
            var formattedTitle = $0
            formattedTitle.font = .verdanaBold(ofSize: 16)
            return formattedTitle
        }
        config.cornerStyle = .large
        configuration = config

        layer.shadowColor = UIColor.grayShadow.cgColor
        layer.shadowOffset = Constants.shadowOffset
        layer.shadowOpacity = 1

        heightAnchor.constraint(equalToConstant: Constants.height).isActive = true

        addTarget(self, action: #selector(touchDownHandler), for: .touchDown)
        addTarget(self, action: #selector(touchUpHandler), for: .touchUpInside)
    }

    @objc private func touchDownHandler() {
        layer.shadowOpacity = 0
    }

    @objc private func touchUpHandler() {
        layer.shadowOpacity = 1
    }
}
