// PlainTextField.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Универсальное текстовое поле с серой заливкой
final class PlainTextField: UITextField {
    // MARK: - Constants

    enum Constants {
        static let minHeight = 47.0
        static let fontSize = 16.0
        static let cornerRadius = 12.0
        static let padding = 18.0
    }

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
        backgroundColor = .grayLight
        font = .verdana(ofSize: Constants.fontSize)
        layer.cornerRadius = Constants.cornerRadius

        leftView = makeSpacingView()
        leftViewMode = .always
        rightView = makeSpacingView()
        rightViewMode = .always

        setupConstraints()
    }

    private func setupConstraints() {
        heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.minHeight).isActive = true
    }

    private func makeSpacingView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: Constants.padding).isActive = true
        return view
    }
}
