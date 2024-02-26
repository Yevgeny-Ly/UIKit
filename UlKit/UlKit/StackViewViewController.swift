// StackViewViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Экран представления светофора StackView
final class StackViewViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static var imageName = "xmark"
    }

    // MARK: - Visual Components

    private lazy var closeControllerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: Constants.imageName), for: .normal)
        button.addTarget(self, action: #selector(closingPressController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let redView: CustomView = {
        let view = CustomView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let yellowView: CustomView = {
        let view = CustomView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let greenView: CustomView = {
        let view = CustomView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Private Properties

    private var trafficLightStackView = UIStackView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        setupViews()
        setupConstraints()
    }

    // MARK: - Private Methods

    private func setupStackView() {
        trafficLightStackView = UIStackView(
            arrangedsSubviews: [redView, yellowView, greenView],
            axis: .vertical,
            spacing: 5
        )
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(closeControllerButton)
        view.addSubview(blackView)
        view.addSubview(trafficLightStackView)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(alongsideTransition: { _ in
            self.redView.widthAnchor.constraint(equalToConstant: 90).isActive = true
            self.redView.heightAnchor.constraint(equalToConstant: 90).isActive = true

            self.yellowView.widthAnchor.constraint(equalToConstant: 90).isActive = true
            self.yellowView.heightAnchor.constraint(equalToConstant: 90).isActive = true

            self.greenView.widthAnchor.constraint(equalToConstant: 90).isActive = true
            self.greenView.heightAnchor.constraint(equalToConstant: 90).isActive = true

            self.blackView.topAnchor.constraint(equalTo: self.redView.topAnchor, constant: -10).isActive = true
            self.blackView.leadingAnchor.constraint(equalTo: self.redView.leadingAnchor, constant: -25).isActive = true
            self.blackView.trailingAnchor.constraint(equalTo: self.redView.trailingAnchor, constant: 25).isActive = true
            self.blackView.bottomAnchor.constraint(equalTo: self.greenView.bottomAnchor, constant: 10).isActive = true

            self.view.layoutIfNeeded()
        })
    }

    private func setupConstraints() {
        closeControllerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
        closeControllerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        closeControllerButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeControllerButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10).isActive = true
        blackView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: -25).isActive = true
        blackView.trailingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 25).isActive = true
        blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10).isActive = true

        trafficLightStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        trafficLightStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        redView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 110).isActive = true

        yellowView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        yellowView.heightAnchor.constraint(equalToConstant: 110).isActive = true

        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 5).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: 110).isActive = true
    }

    @objc
    private func closingPressController() {
        dismiss(animated: true)
    }
}
