// NSLayoutAnchorViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Экран представления светофора LayoutConstrains
final class NSLayoutAnchorViewController: UIViewController {
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

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        redView.layer.cornerRadius = redView.frame.size.width / 2.0
        yellowView.layer.cornerRadius = yellowView.frame.size.width / 2.0
        greenView.layer.cornerRadius = greenView.frame.size.width / 2.0
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

    // MARK: - Private Methods

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(closeControllerButton)
        view.addSubview(blackView)
        blackView.addSubview(redView)
        blackView.addSubview(yellowView)
        blackView.addSubview(greenView)
    }

    private func setupConstraints() {
        closeControllerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 45).isActive = true
        closeControllerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        closeControllerButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        closeControllerButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 110).isActive = true

        yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 5).isActive = true
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        yellowView.heightAnchor.constraint(equalToConstant: 110).isActive = true

        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 5).isActive = true
        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: 110).isActive = true

        blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10).isActive = true
        blackView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -25).isActive = true
        blackView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 25).isActive = true
        blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10).isActive = true
    }

    @objc
    private func closingPressController() {
        dismiss(animated: true)
    }
}
