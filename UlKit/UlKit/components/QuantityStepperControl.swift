// QuantityStepperControl.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Компонент выбора количества
final class QuantityStepperControl: UIView {
    // MARK: - Constants

    enum Constants {
        static let stepperMaxWidth = 60.0
        static let stepperValueLabelSize = 12.0
        static let stepperValueLabelPadding = 3.0
        static let stepperValueMinWidth = 17.0
        static let stepperButtonSize = 15.0
    }

    // MARK: - Visual Components

    private lazy var minusButton: UIButton = {
        let button = makeStepperButton()
        button.setTitle("-", for: .normal)
        button.addTarget(self, action: #selector(decrementQuantity), for: .touchUpInside)
        return button
    }()

    private lazy var plusButton: UIButton = {
        let button = makeStepperButton()
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(incrementQuantity), for: .touchUpInside)
        return button
    }()

    private lazy var stepperValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .verdana(ofSize: Constants.stepperValueLabelSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(greaterThanOrEqualToConstant: Constants.stepperValueMinWidth).isActive = true
        return label
    }()

    // MARK: - Public Properties

    var value: Int = 0 {
        didSet {
            stepperValueLabel.text = String(value)
        }
    }

    var quantityChangeHandler: ((Int) -> Void)?

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStepper()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStepper()
    }

    // MARK: - Private Methods

    private func setupStepper() {
        addSubview(minusButton)
        addSubview(plusButton)
        addSubview(stepperValueLabel)
        translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }

    private func setupConstraints() {
        widthAnchor.constraint(lessThanOrEqualToConstant: Constants.stepperMaxWidth).isActive = true
        stepperValueLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stepperValueLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stepperValueLabel.leadingAnchor.constraint(
            equalTo: minusButton.trailingAnchor,
            constant: Constants.stepperValueLabelPadding
        ).isActive = true
        plusButton.leadingAnchor.constraint(
            equalTo: stepperValueLabel.trailingAnchor,
            constant: Constants.stepperValueLabelPadding
        ).isActive = true
        plusButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        minusButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    private func makeStepperButton() -> UIButton {
        let button = SecondaryButton()
        button.widthAnchor.constraint(equalToConstant: Constants.stepperButtonSize).isActive = true
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        return button
    }

    @objc private func incrementQuantity() {}

    @objc private func decrementQuantity() {}
}
