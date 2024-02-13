// AdditionsSelectViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран выбора дополнительных ингридиентов
final class AdditionsSelectViewController: UIViewController {
    // MARK: - Visual Components

    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 53, width: 294, height: 44))
        label.text = "Выберите дополнительные ингредіенты"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.verdanaBold18()

        return label
    }()

    // MARK: - Public Properties

    var selectedAdditions: [CoffeeConfigurator.Addition]?
    var updateAdditionsSelection: (([CoffeeConfigurator.Addition]) -> Void)?

    // MARK: - Private Properties

    private var switchToAdditionsMap = [UISwitch: CoffeeConfigurator.Addition]()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupNav()
    }

    // MARK: - Private Methods

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)

        for (index, add) in CoffeeConfigurator.Addition.allCases.enumerated() {
            let addition = makeAddition(add)
            addition.frame = CGRect(x: 20, y: 124 + index * 50, width: 355, height: 50)
            view.addSubview(addition)
        }
    }

    private func setupNav() {
        let crossButton = UIBarButtonItem(
            image: .closeIcon.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(saveAndClose)
        )
        navigationItem.setLeftBarButton(crossButton, animated: false)
    }

    private func makeAddition(_ addition: CoffeeConfigurator.Addition) -> UIView {
        let view = UIView()
        let label = makeAdditionLabel(
            name: addition.rawValue,
            price: CoffeeConfigurator.additionsPriceMap[addition, default: 0]
        )
        let switchControl = UISwitch()
        switchControl.addTarget(self, action: #selector(toggleAddition(_:)), for: .valueChanged)
        switchControl.frame = CGRect(x: 281, y: 0, width: 54, height: 35)
        switchControl.isOn = selectedAdditions?.contains(addition) ?? false
        switchToAdditionsMap[switchControl] = addition

        view.addSubview(label)
        view.addSubview(switchControl)

        return view
    }

    private func makeAdditionLabel(name: String, price: Int) -> UILabel {
        let label = UILabel()

        let labelString = NSMutableAttributedString(
            string: name,
            attributes: [.font: UIFont.verdana18() ?? UIFont.systemFont(ofSize: 18)]
        )
        let priceString = NSAttributedString(
            string: " +\(price) руб",
            attributes: [
                .font: UIFont.verdana16() ?? UIFont.systemFont(ofSize: 18),
                .foregroundColor: UIColor.greenMain
            ]
        )
        labelString.append(priceString)
        label.attributedText = labelString
        label.frame = CGRect(origin: .zero, size: CGSize(width: 275, height: 35))
        return label
    }

    @objc private func toggleAddition(_ switchControl: UISwitch) {
        if let addition = switchToAdditionsMap[switchControl] {
            if switchControl.isOn {
                selectedAdditions?.append(addition)
            } else {
                selectedAdditions = selectedAdditions?.filter { $0 != addition }
            }
        }
    }

    @objc private func saveAndClose() {
        if let selectedAdditions {
            updateAdditionsSelection?(selectedAdditions)
        }
        dismiss(animated: true)
    }
}
