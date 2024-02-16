// SizePickerView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Компонент выбора размера
final class SizePickerView: UIView {
    // MARK: - Constants

    enum Constants {
        static let optionButtonHeight = 17.0
        static let optionButtonMinwidth = 30.0
        static let spacing = 4.0
        static let itemsInRow = 4
    }

    // MARK: - Public Properties

    var selectedSize: String? {
        didSet {
            sizeOptionButtons.forEach { $0.isActive = false }
            sizeOptionButtons.first {
                $0.currentTitle == selectedSize || $0.currentAttributedTitle?.string == selectedSize
            }?.isActive = true
        }
    }

    var availableSizes: [String]

    // MARK: - Private Properties

    private var sizeOptionButtons = [SecondaryButton]()

    // MARK: - Initializers

    init(availableSizes: [String]) {
        self.availableSizes = availableSizes
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false

        for sizeOption in availableSizes {
            let sizeOptionButton = makeSizeOptionButton(text: sizeOption)
            addSubview(sizeOptionButton)
            sizeOptionButtons.append(sizeOptionButton)
        }

        setupConstraints()
    }

    private func setupConstraints() {
        var previousSizeOptionButton: UIButton?
        for (index, sizeOptionButton) in sizeOptionButtons.enumerated() {
            if let previousSizeOptionButton {
                sizeOptionButton.leadingAnchor.constraint(
                    equalTo: previousSizeOptionButton.trailingAnchor,
                    constant: Constants.spacing
                ).isActive = true
            } else {
                sizeOptionButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            }

            previousSizeOptionButton = sizeOptionButton

            if (index + 1).isMultiple(of: Constants.itemsInRow) {
                previousSizeOptionButton = nil
            }

            sizeOptionButton.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat((index / 4) * 21))
                .isActive = true
        }
    }

    private func makeSizeOptionButton(text: String) -> SecondaryButton {
        let button = SecondaryButton()
        button.setTitle(text, for: .normal)
        button.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.optionButtonMinwidth).isActive = true
        button.heightAnchor.constraint(equalToConstant: Constants.optionButtonHeight).isActive = true
        return button
    }
}
