// ChoiceLayoutViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Экран представления вариаций верстки
final class ChoiceLayoutViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static var fontVerdana = "Verdana"
        static var fontSize: CGFloat = 14
        static var titleNSLayoutAnchor = "Traffic light NSLayoutAnchor"
        static var titleStackView = "Traffic light StackView"
        static var titleStoryboard = "Traffic light Storyboard"
        static var titleNameStoryboard = "Main"
        static var titleNameController = "storyboardViewController"
    }

    // MARK: - Visual Components

    private lazy var nsLayoutAnchorButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.titleNSLayoutAnchor, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: Constants.fontSize)
        button.addTarget(self, action: #selector(keystrokeNSLayoutAnchor), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var stackViewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.titleStackView, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: Constants.fontSize)
        button.addTarget(self, action: #selector(keystrokeStackView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var storyboardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.titleStoryboard, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: Constants.fontSize)
        button.addTarget(self, action: #selector(keystrokeStoryboard), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Private Properties

    private var buttonsStackView = UIStackView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        setupViews()
        setupConstraints()
    }

    private func setupStackView() {
        buttonsStackView = UIStackView(
            arrangedsSubviews: [nsLayoutAnchorButton, stackViewButton, storyboardButton],
            axis: .vertical,
            spacing: 10
        )
    }

    // MARK: - Private Methods

    private func setupViews() {
        view.backgroundColor = .orange
        view.addSubview(buttonsStackView)
    }

    private func setupConstraints() {
        buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc
    private func keystrokeNSLayoutAnchor() {
        let viewController = NSLayoutAnchorViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }

    @objc
    private func keystrokeStackView() {
        let viewController = StackViewViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }

    @objc
    private func keystrokeStoryboard() {
        let storyboard = UIStoryboard(name: Constants.titleNameStoryboard, bundle: nil)
        if let viewController = storyboard
            .instantiateViewController(withIdentifier: Constants.titleNameController) as? StoryboardViewController
        {
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: true)
        }
    }
}
