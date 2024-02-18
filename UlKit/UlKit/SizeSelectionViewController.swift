// SizeSelectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Описывает модальный экран с возможными размерами выбранной обуви
final class SizeSelectionViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let textSizeSelection = "Выберите размер"
        static let fontSize: CGFloat = 16
        static let font = "Verdana"
        static let textThirtyFifthSize = "35 EU"
        static let textThirtySixthSize = "36 EU"
        static let textThirtySeventhSize = "37 EU"
        static let textThirtyEighthSize = "38 EU"
        static let textThirtyNinthSize = "39 EU"
    }

    // MARK: - Visual Components

    private lazy var closeButton: UIButton = {
        let image = UIImage(named: "close")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(closeViewController), for: .touchUpInside)
        return button
    }()

    private let sizeSelectionLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textSizeSelection
        label.font = .verdanaBold(ofSize: Constants.fontSize)
        label.textColor = .black
        return label
    }()

    private lazy var thirtyFifthSizeLabel: UIButton = createButton(
        title: Constants.textThirtyFifthSize,
        action: #selector(method)
    )

    private lazy var firstLine: UIView = createLineView()

    private lazy var thirtySixthSizeLabel: UIButton = createButton(
        title: Constants.textThirtySixthSize,
        action: #selector(method)
    )

    private lazy var secondLine: UIView = createLineView()

    private lazy var thirtySeventhSizeLabel: UIButton = createButton(
        title: Constants.textThirtySeventhSize,
        action: #selector(method)
    )

    private lazy var thirdLine: UIView = createLineView()

    private lazy var thirtyEighthSizeLabel: UIButton = createButton(
        title: Constants.textThirtyEighthSize,
        action: #selector(method)
    )

    private lazy var fourthLine: UIView = createLineView()

    private lazy var thirtyNinthSizeLabel: UIButton = createButton(
        title: Constants.textThirtyNinthSize,
        action: #selector(method)
    )

    private lazy var fifthLine: UIView = createLineView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupConstraints()
    }

    // MARK: - Private Methods

    private func addSubviews() {
        view.backgroundColor = .white
        for item in [
            closeButton,
            sizeSelectionLabel,
            thirtyFifthSizeLabel,
            firstLine,
            thirtySixthSizeLabel,
            secondLine,
            thirtySeventhSizeLabel,
            thirdLine,
            thirtyEighthSizeLabel,
            fourthLine,
            thirtyNinthSizeLabel,
            fifthLine
        ] {
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
    }

    private func setupConstraints() {
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        closeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

        sizeSelectionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        sizeSelectionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        thirtyFifthSizeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 77).isActive = true
        thirtyFifthSizeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        thirtyFifthSizeLabel.widthAnchor.constraint(equalToConstant: 278).isActive = true
        thirtyFifthSizeLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true

        firstLine.topAnchor.constraint(equalTo: thirtyFifthSizeLabel.bottomAnchor, constant: 7).isActive = true
        firstLine.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        thirtySixthSizeLabel.topAnchor.constraint(equalTo: firstLine.bottomAnchor, constant: 10).isActive = true
        thirtySixthSizeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        thirtySixthSizeLabel.widthAnchor.constraint(equalToConstant: 278).isActive = true
        thirtySixthSizeLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true

        secondLine.topAnchor.constraint(equalTo: thirtySixthSizeLabel.bottomAnchor, constant: 7).isActive = true
        secondLine.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        thirtySeventhSizeLabel.topAnchor.constraint(equalTo: secondLine.bottomAnchor, constant: 10).isActive = true
        thirtySeventhSizeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        thirtySeventhSizeLabel.widthAnchor.constraint(equalToConstant: 278).isActive = true
        thirtySeventhSizeLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true

        thirdLine.topAnchor.constraint(equalTo: thirtySeventhSizeLabel.bottomAnchor, constant: 7).isActive = true
        thirdLine.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        thirtyEighthSizeLabel.topAnchor.constraint(equalTo: thirdLine.bottomAnchor, constant: 10).isActive = true
        thirtyEighthSizeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        thirtyEighthSizeLabel.widthAnchor.constraint(equalToConstant: 278).isActive = true
        thirtyEighthSizeLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true

        fourthLine.topAnchor.constraint(equalTo: thirtyEighthSizeLabel.bottomAnchor, constant: 7).isActive = true
        fourthLine.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        thirtyNinthSizeLabel.topAnchor.constraint(equalTo: fourthLine.bottomAnchor, constant: 10).isActive = true
        thirtyNinthSizeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        thirtyNinthSizeLabel.widthAnchor.constraint(equalToConstant: 278).isActive = true
        thirtyNinthSizeLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true

        fifthLine.topAnchor.constraint(equalTo: thirtyNinthSizeLabel.bottomAnchor, constant: 7).isActive = true
        fifthLine.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    private func createButton(title: String, action: Selector? = nil) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.font, size: Constants.fontSize)
        button.contentHorizontalAlignment = .left
        if let action = action {
            button.addTarget(self, action: action, for: .touchUpInside)
        }
        return button
    }

    private func createLineView() -> UIView {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.widthAnchor.constraint(equalToConstant: 335).isActive = true
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }

    @objc
    private func closeViewController() {
        dismiss(animated: true)
    }
}
