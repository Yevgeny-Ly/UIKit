// SecondaryButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вторичная кнопка
final class SecondaryButton: UIButton {
    // MARK: - Constants

    enum Constants {
        static let titleSize = 10.0
        static let cornerRadius = 8.0
        static let borderWidth = 1.0
    }

    var isActive: Bool = false {
        didSet {
            layer.borderColor = isActive ? UIColor.pinkMain.cgColor : UIColor.pinkLight.cgColor
        }
    }

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    // MARK: - Public Methods

    override func setTitle(_ title: String?, for state: UIControl.State) {
        if let title {
            setAttributedTitle(NSAttributedString(string: title, attributes: [
                .font: UIFont.verdana(ofSize: Constants.titleSize) ?? UIFont.systemFont(ofSize: Constants.titleSize),
                .foregroundColor: UIColor.blackMain
            ]), for: state)
        }
    }

    // MARK: - Private Methods

    private func setupButton() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .pinkLight
        layer.cornerRadius = Constants.cornerRadius
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = UIColor.pinkLight.cgColor
    }
}
