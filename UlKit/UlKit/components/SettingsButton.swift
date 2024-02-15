// SettingsButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кнопка-панель настроек
final class SettingsButton: UIButton {
    enum Constants {
        static let borderWidth = 1.0
        static let buttonHeight = 38.0
        static let iconSize = CGSize(width: 24.0, height: 24.0)
        static let iconPadding = 13.0
    }

    private var borderBottomView: UIView = {
        let border = UIView()
        border.backgroundColor = .grayBorder
        border.translatesAutoresizingMaskIntoConstraints = false
        border.heightAnchor.constraint(equalToConstant: Constants.borderWidth).isActive = true
        return border
    }()

    var title: String = "" {
        didSet {
            configuration?.attributedTitle = AttributedString(
                title,
                attributes: AttributeContainer([
                    .font: UIFont.verdana(ofSize: 16) ?? UIFont.systemFont(ofSize: 16)
                ])
            )
        }
    }

    var image: UIImage? {
        didSet {
            configuration?.image = image
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        var config = UIButton.Configuration.plain()
        contentHorizontalAlignment = .leading
        config.imagePlacement = .leading
        config.imageReservation = Constants.iconSize.width
        config.imagePadding = Constants.iconPadding
        config.baseForegroundColor = .blackMain
        configuration = config

        addSubview(borderBottomView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            borderBottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            leadingAnchor.constraint(equalTo: borderBottomView.leadingAnchor),
            trailingAnchor.constraint(equalTo: borderBottomView.trailingAnchor)
        ])
    }
}
