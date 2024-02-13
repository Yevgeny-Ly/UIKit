// BirthdayListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// описывает экран списка именинников
final class BirthdayListViewController: UIViewController {
    // MARK: - Private Properties

    private var firstBirthdayImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "helenaLink")
        return view
    }()

    private var initialsFirstPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "Helena Link"
        label.font = .verdanaBold16()
        return label
    }()

    private var dataFirstBirthday: UILabel = {
        let label = UILabel()
        label.text = "10.03 - turns 25"
        label.font = .verdana14()
        return label
    }()

    private var cakeImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "cake")
        return view
    }()

    private var secondBirthdayImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "veronaTusk")
        return view
    }()

    private var initialsSecondPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "Verona Tusk"
        label.font = .verdanaBold16()
        return label
    }()

    private var dataSecondBirthday: UILabel = {
        let label = UILabel()
        label.text = "20.03 - turns 39"
        label.font = .verdana14()
        return label
    }()

    private var daysBeforeSecondBirthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "10 \n days"
        label.textAlignment = .center
        label.font = .verdanaBold16()
        label.textColor = #colorLiteral(red: 0.3508446813, green: 0.2632109523, blue: 0.5796329975, alpha: 1)
        label.numberOfLines = 0
        return label
    }()

    private var thirdBirthdayImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "alexSmith")
        return view
    }()

    private var initialsThirdPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "Alex Smith"
        label.font = .verdanaBold16()
        return label
    }()

    private var dataThirdBirthday: UILabel = {
        let label = UILabel()
        label.text = "21.04 - turns 51"
        label.font = .verdana14()
        return label
    }()

    private var daysBeforeThirdBirthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "42 \n days"
        label.textAlignment = .center
        label.font = .verdanaBold16()
        label.textColor = #colorLiteral(red: 0.3508446813, green: 0.2632109523, blue: 0.5796329975, alpha: 1)
        label.numberOfLines = 0
        return label
    }()

    private var fourthBirthdayImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "tomJohnson")
        return view
    }()

    private var initialsFourthPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "Tom Johnson"
        label.font = .verdanaBold16()
        return label
    }()

    private var dataFourthBirthday: UILabel = {
        let label = UILabel()
        label.text = "05.06 - turns 18"
        label.font = .verdana14()
        return label
    }()

    private var daysBeforeFourthBirthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "87 \n days"
        label.textAlignment = .center
        label.font = .verdanaBold16()
        label.textColor = #colorLiteral(red: 0.3508446813, green: 0.2632109523, blue: 0.5796329975, alpha: 1)
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        customizesNavigationController()
        addSubview()
    }

    override func viewWillLayoutSubviews() {
        setupSubviews()
    }

    // MARK: - Private Methods

    private func addSubview() {
        view.backgroundColor = .white
        view.addSubview(firstBirthdayImageView)
        view.addSubview(initialsFirstPersonLabel)
        view.addSubview(dataFirstBirthday)
        view.addSubview(cakeImageView)
        view.addSubview(secondBirthdayImageView)
        view.addSubview(initialsSecondPersonLabel)
        view.addSubview(dataSecondBirthday)
        view.addSubview(daysBeforeSecondBirthdayLabel)
        view.addSubview(thirdBirthdayImageView)
        view.addSubview(initialsThirdPersonLabel)
        view.addSubview(dataThirdBirthday)
        view.addSubview(daysBeforeThirdBirthdayLabel)
        view.addSubview(fourthBirthdayImageView)
        view.addSubview(initialsFourthPersonLabel)
        view.addSubview(dataFourthBirthday)
        view.addSubview(daysBeforeFourthBirthdayLabel)
    }

    private func setupSubviews() {
        firstBirthdayImageView.frame = CGRect(x: 19, y: 105, width: 75, height: 75)
        initialsFirstPersonLabel.frame = CGRect(x: 102, y: 119, width: 209, height: 20)
        dataFirstBirthday.frame = CGRect(x: 102, y: 147, width: 209, height: 20)
        cakeImageView.frame = CGRect(x: 314, y: 119, width: 44, height: 44)
        secondBirthdayImageView.frame = CGRect(x: 20, y: 200, width: 75, height: 75)
        initialsSecondPersonLabel.frame = CGRect(x: 103, y: 214, width: 209, height: 20)
        dataSecondBirthday.frame = CGRect(x: 103, y: 242, width: 209, height: 20)
        daysBeforeSecondBirthdayLabel.frame = CGRect(x: 310, y: 214, width: 50, height: 50)
        thirdBirthdayImageView.frame = CGRect(x: 20, y: 295, width: 75, height: 75)
        initialsThirdPersonLabel.frame = CGRect(x: 103, y: 309, width: 209, height: 20)
        dataThirdBirthday.frame = CGRect(x: 103, y: 337, width: 209, height: 20)
        daysBeforeThirdBirthdayLabel.frame = CGRect(x: 310, y: 309, width: 50, height: 50)
        fourthBirthdayImageView.frame = CGRect(x: 22, y: 390, width: 75, height: 75)
        initialsFourthPersonLabel.frame = CGRect(x: 105, y: 404, width: 209, height: 20)
        dataFourthBirthday.frame = CGRect(x: 105, y: 432, width: 209, height: 20)
        daysBeforeFourthBirthdayLabel.frame = CGRect(x: 310, y: 404, width: 50, height: 50)
    }

    private func customizesNavigationController() {
        navigationItem.title = "Birthday Reminder"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .done,
            target: self,
            action: #selector(pressButtonHumanAdd)
        )
    }

    @objc
    private func pressButtonHumanAdd() {
        let nextViewController = HumanAdditionViewController()
        present(nextViewController, animated: true)
    }
}
