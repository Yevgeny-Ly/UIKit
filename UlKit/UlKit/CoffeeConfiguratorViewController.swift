// CoffeeConfiguratorViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Конфигуратор кофе с возможностью выбора типа напитка и перехода на экраны выбора обжарки и доп-ингридиентов
final class CoffeeConfiguratorViewController: UIViewController {
    // MARK: - Visual Components

    private lazy var imageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLightBrown
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 346)
        view.layer.cornerRadius = 20
        return view
    }()

    private lazy var coffeImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 112, y: 128, width: 150, height: 150)
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var coffeTypeControl: UISegmentedControl = {
        let control = UISegmentedControl(items: allCoffeTypes.map(\.rawValue))
        control.frame = CGRect(x: 15, y: 368, width: 345, height: 44)
        control.setTitleTextAttributes([
            .font: UIFont.verdana14() ?? UIFont()
        ], for: .normal)
        control.addTarget(self, action: #selector(selectCoffeType(_:)), for: .valueChanged)
        return control
    }()

    // MARK: - Private Properties

    private var coffeConfigurator = CoffeeConfigurator()
    private var allCoffeTypes = CoffeeConfigurator.CoffeType.allCases
    private var selectedCoffeTypeIndex: Int {
        allCoffeTypes.firstIndex(of: coffeConfigurator.coffeeType) ?? -1
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNav()
    }

    // MARK: - Private Methods

    private func setupView() {
        imageContainerView.addSubview(coffeImage)
        view.addSubview(imageContainerView)
        view.addSubview(coffeTypeControl)

        updateCoffeImage()
        updateCofeeTypeControl()
    }

    private func setupNav() {}

    // Update UI methods
    private func updateCoffeImage() {
        switch coffeConfigurator.coffeeType {
        case .americano:
            coffeImage.image = .colorCoffee
        case .capuccino:
            coffeImage.image = .cappuccino
        case .latte:
            coffeImage.image = .latte
        }
    }

    private func updateCofeeTypeControl() {
        coffeTypeControl.selectedSegmentIndex = selectedCoffeTypeIndex
    }

    @objc private func selectCoffeType(_ coffeeTypeControl: UISegmentedControl) {
        if coffeeTypeControl.selectedSegmentIndex != -1 {
            coffeConfigurator.coffeeType = allCoffeTypes[coffeeTypeControl.selectedSegmentIndex]
            updateCofeeTypeControl()
            updateCoffeImage()
        }
    }
}
