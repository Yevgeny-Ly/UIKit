// RoastingSelectViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран выбора обжарки кофе
final class RoastingSelectViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let darkRoastingLable = "Темная\nобжарка"
        static let lightRoastingLabel = "Свѣтлая\nобжарка"
    }

    // MARK: - Visual Components

    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 53, width: 294, height: 30))
        label.text = "Уточните обжарку зеренъ"
        label.textAlignment = .center
        label.font = UIFont.verdanaBold18()

        return label
    }()

    // MARK: - Public Properties

    var selectedRoasting: CoffeeConfigurator.Roasting?
    var updateRoastingSelectionHandler: ((CoffeeConfigurator.Roasting) -> Void)?

    // MARK: - Private Properties

    private var controlsToRoastingMap = [ModificatorControl: CoffeeConfigurator.Roasting]()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNav()
    }

    // MARK: - Private Methods

    private func setupNav() {
        let crossButton = UIBarButtonItem(
            image: .closeIcon.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(saveAndClose)
        )
        navigationItem.setLeftBarButton(crossButton, animated: false)
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)

        for roast in CoffeeConfigurator.Roasting.allCases {
            let control = makeRoastingControl(roasting: roast)
            control.isSelected = roast == selectedRoasting
            control.tapHandler = changeRoasting
            controlsToRoastingMap[control] = roast
            view.addSubview(control)
        }
    }

    private func makeRoastingControl(roasting: CoffeeConfigurator.Roasting) -> ModificatorControl {
        let control = ModificatorControl()
        switch roasting {
        case .dark:
            control.setImage(.darkRoast)
            control.setLabelText(Constants.darkRoastingLable)
            control.frame.origin = CGPoint(x: 15, y: 102)
        case .light:
            control.setImage(.lightRoast)
            control.setLabelText(Constants.lightRoastingLabel)
            control.frame.origin = CGPoint(x: 195, y: 102)
        }
        return control
    }

    @objc private func changeRoasting(_ control: ModificatorControl) {
        if !control.isSelected {
            view.subviews.compactMap { $0 as? ModificatorControl }.forEach { $0.isSelected = false }
            control.isSelected = true
            selectedRoasting = controlsToRoastingMap[control]
        }
    }

    @objc private func saveAndClose() {
        if let selectedRoasting {
            updateRoastingSelectionHandler?(selectedRoasting)
        }
        dismiss(animated: true)
    }
}
