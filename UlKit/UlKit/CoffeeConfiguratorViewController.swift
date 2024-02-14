// CoffeeConfiguratorViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран конфигурации кофе
final class CoffeeConfiguratorViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let modificationsLabel = "Модификация"
        static let additionsLabel = "Дополнительные\nингредіенты"
        static let orderButtonLabel = "Заказать"
        static let priceLabel = "Цѣна -"
        static let currencyRublesLabel = "руб"
        static let darkRoastingLable = "Темная\nобжарка"
        static let lightRoastingLabel = "Свѣтлая\nобжарка"
        static let promoCodeLabel = "Лови промокод roadmaplove на любой напиток из Кофейнов"
    }

    // MARK: - Visual Components

    private lazy var imageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLightBrown
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 346)
        view.layer.cornerRadius = 20
        return view
    }()

    private lazy var coffeImageView: UIImageView = {
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

    private lazy var modificationsSectionLabel = makeBoldLabel(
        text: Constants.modificationsLabel,
        frame: CGRect(x: 15, y: 432, width: 345, height: 30)
    )
    private lazy var priceLabel = makeBoldLabel(
        text: priceString,
        frame: CGRect(x: 15, y: 669, width: 345, height: 30),
        alignment: .right
    )

    private lazy var roastingControl = makeModificatorControl(origin: CGPoint(x: 15, y: 482))
    private lazy var additionsControl = makeModificatorControl(
        origin: CGPoint(x: 195, y: 482),
        label: Constants.additionsLabel
    )

    private lazy var orderButton: UIButton = {
        let button = CustomButton()
        button.frame.origin = CGPoint(x: 15, y: 717)
        button.titleText = Constants.orderButtonLabel
        return button
    }()

    // MARK: - Private Properties

    private var coffeConfigurator = CoffeeConfigurator()
    private var allCoffeTypes = CoffeeConfigurator.CoffeType.allCases
    private var selectedCoffeTypeIndex: Int {
        allCoffeTypes.firstIndex(of: coffeConfigurator.coffeeType) ?? -1
    }

    private var priceString: String {
        "\(Constants.priceLabel) \(coffeConfigurator.price) \(Constants.currencyRublesLabel)"
    }

    private var hasAdditions: Bool {
        !coffeConfigurator.additions.isEmpty
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationItem()
    }

    // MARK: - Private Methods

    private func setupView() {
        imageContainerView.addSubview(coffeImageView)
        view.addSubview(imageContainerView)
        view.addSubview(coffeTypeControl)
        view.addSubview(modificationsSectionLabel)
        view.addSubview(priceLabel)
        view.addSubview(roastingControl)
        view.addSubview(additionsControl)
        view.addSubview(orderButton)

        roastingControl.tapHandler = changeRoasting
        additionsControl.tapHandler = changeAdditions

        orderButton.addTarget(self, action: #selector(summarizeOrder), for: .touchUpInside)

        updateCoffeImage()
        updateCofeeTypeControl()
        updateRoastingControl()
        updateAdditionsControl()
    }

    private func setupNavigationItem() {
        let shareButton = UIBarButtonItem(
            image: .paperPlane.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(sharePromoCode)
        )
        let backButton = UIBarButtonItem(
            image: .backCircleIcon.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(goBack)
        )
        navigationItem.setRightBarButton(shareButton, animated: false)
        navigationItem.setLeftBarButton(backButton, animated: false)
    }

    // Update UI methods
    private func updateCoffeImage() {
        switch coffeConfigurator.coffeeType {
        case .americano:
            coffeImageView.image = .colorCoffee
        case .capuccino:
            coffeImageView.image = .cappuccino
        case .latte:
            coffeImageView.image = .latte
        }
    }

    private func updateCofeeTypeControl() {
        coffeTypeControl.selectedSegmentIndex = selectedCoffeTypeIndex
    }

    private func updateRoastingControl() {
        switch coffeConfigurator.roasting {
        case .dark:
            roastingControl.setImage(.darkRoast)
            roastingControl.setLabelText(Constants.darkRoastingLable)
        case .light:
            roastingControl.setImage(.lightRoast)
            roastingControl.setLabelText(Constants.lightRoastingLabel)
        }
    }

    private func updateAdditionsControl() {
        additionsControl.setImage(hasAdditions ? .checkIcon : .plusIcon)
    }

    private func updatePriceLabel() {
        priceLabel.text = priceString
    }

    private func makeBoldLabel(text: String, frame: CGRect, alignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel(frame: frame)
        label.font = UIFont.verdanaBold18()
        label.text = text
        label.textAlignment = alignment
        return label
    }

    private func makeModificatorControl(origin: CGPoint, label: String? = nil) -> ModificatorControl {
        let control = ModificatorControl()
        control.frame.origin = origin
        if let label {
            control.setLabelText(label)
        }
        return control
    }

    @objc private func selectCoffeType(_ coffeeTypeControl: UISegmentedControl) {
        if coffeeTypeControl.selectedSegmentIndex != -1 {
            coffeConfigurator.coffeeType = allCoffeTypes[coffeeTypeControl.selectedSegmentIndex]
            updateCofeeTypeControl()
            updateCoffeImage()
        }
    }

    @objc private func changeRoasting(_ control: ModificatorControl) {
        let roastingViewController = RoastingSelectViewController()
        roastingViewController.selectedRoasting = coffeConfigurator.roasting
        roastingViewController.updateRoastingSelectionHandler = { [weak self] in
            self?.coffeConfigurator.roasting = $0
            self?.updateRoastingControl()
        }
        roastingViewController.modalPresentationStyle = .formSheet
        present(UINavigationController(rootViewController: roastingViewController), animated: true)
    }

    @objc private func changeAdditions(_ control: ModificatorControl) {
        let additionsViewController = AdditionsSelectViewController()
        additionsViewController.selectedAdditions = coffeConfigurator.additions
        additionsViewController.updateAdditionsSelectionHandler = { [weak self] in
            self?.coffeConfigurator.additions = $0
            self?.updateAdditionsControl()
            self?.updatePriceLabel()
        }
        present(UINavigationController(rootViewController: additionsViewController), animated: true)
    }

    @objc private func sharePromoCode() {
        let promoCode = Constants.promoCodeLabel
        let activityViewController = UIActivityViewController(activityItems: [promoCode], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }

    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func summarizeOrder() {
        let orderViewController = OrderViewController()
        var orderItems = [(coffeConfigurator.coffeeType.rawValue, coffeConfigurator.basePrice)]
        for addition in coffeConfigurator.additions {
            orderItems.append((
                addition.rawValue,
                CoffeeConfigurator.additionsPriceMap[addition, default: 0]
            ))
        }
        orderViewController.orderItems = orderItems
        orderViewController.orderSum = coffeConfigurator.price
        present(orderViewController, animated: true)
    }
}
