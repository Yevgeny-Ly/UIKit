// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// описывает взаимодействие view и controller
final class ViewController: UIViewController {
    // MARK: - Type

    private var backgroundTextView = UIView()
    private var consistencyNumbers = [Int]()

    // MARK: - Private Properties

    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background")
        return imageView
    }()

    private var greetingsLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont(name: "Verdana", size: 30)
        label.numberOfLines = 2
        return label
    }()

    private lazy var playGuessNumberButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.6101519465, green: 0.4977072477, blue: 0.7082346082, alpha: 1)
        button.setTitle("Угадай \n число", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 30
        button.layer.borderColor = #colorLiteral(red: 0.2991576493, green: 0.1407449841, blue: 0.4514412284, alpha: 1)
        button.layer.borderWidth = 2
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        button.addTarget(self, action: #selector(pressButtonGuessNumber), for: .touchUpInside)
        return button
    }()

    private lazy var playCalculatorButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.3939370811, green: 0.7096473575, blue: 0.5092409849, alpha: 1)
        button.setTitle("Калькулятор", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 30
        button.layer.borderColor = #colorLiteral(red: 0.242816329, green: 0.5160967708, blue: 0.1859998107, alpha: 1)
        button.layer.borderWidth = 2
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        button.addTarget(self, action: #selector(pressButtonCalculator), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        customizesAlert(title: "Пожалуйста, \n представьтесь", message: nil, preferredStyle: .alert)
        fulfillsLoop()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        backgroundImage.frame = view.bounds
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustsTheFrame()
    }

    // MARK: - Private Methods

    private func fulfillsLoop() {
        for _ in 0 ..< 5 {
            consistencyNumbers.append(Int.random(in: 1 ... 10))
        }
    }

    private func adjustsTheFrame() {
        greetingsLabel.textAlignment = .center
        greetingsLabel.frame = CGRect(x: 50, y: 51, width: 275, height: 80)
        playGuessNumberButton.frame = CGRect(x: 82, y: 264, width: 150, height: 150)
        playCalculatorButton.frame = CGRect(x: 132, y: 470, width: 200, height: 200)
    }

    private func addSubview() {
        view.backgroundColor = .white
        view.addSubview(backgroundImage)
        view.addSubview(backgroundTextView)
        view.addSubview(greetingsLabel)
        view.addSubview(playGuessNumberButton)
        view.addSubview(playCalculatorButton)
    }

    private func customizesAlert(title: String, message: String?, preferredStyle: UIAlertController.Style) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: preferredStyle
        )

        alertController.addAction(UIAlertAction(title: "Готово", style: .default, handler: { _ in
            let nameText = alertController.textFields?.first
            self.greetingsLabel.text? += "Приветствую,\n" + (nameText?.text ?? "имя") + "!"

            self.backgroundTextView.backgroundColor = #colorLiteral(red: 0.537355125, green: 0.8031187057, blue: 0.9100272059, alpha: 1)
            self.backgroundTextView.layer.borderWidth = 2
            self.backgroundTextView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.backgroundTextView.frame = CGRect(x: 0, y: 51, width: 375, height: 82)
        }))
        alertController.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }

        present(alertController, animated: true)
    }

    @objc
    private func pressButtonGuessNumber() {
        let alertController = UIAlertController(
            title: "Угадайте число от 1 до 10",
            message: nil,
            preferredStyle: .alert
        )
        alertController.addTextField { textField in
            textField.placeholder = "Введите число"
        }

        var guessedNumber = false

        let okey = UIAlertAction(title: "Oк", style: .default) { _ in
            guard let textNumber = alertController.textFields?[0].text,
                  let userInputNumber = Int(textNumber)
            else {
                return
            }

            for number in self.consistencyNumbers where number == userInputNumber {
                guessedNumber = true
                break
            }

            if guessedNumber {
                let alert = UIAlertController(title: "Поздравляю!", message: "Вы угадали", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Oк", style: .cancel))
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Упс!", message: "Это неверный ответ", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ок", style: .cancel))
                self.present(alert, animated: true)
            }
        }

        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alertController.addAction(okey)

        present(alertController, animated: true)
    }

    @objc
    private func pressButtonCalculator() {
        let calculatorAlertController = UIAlertController(
            title: "Введите ваши числа",
            message: nil,
            preferredStyle: .alert
        )

        calculatorAlertController.addTextField { textField in
            textField.placeholder = "Число 1"
        }
        calculatorAlertController.addTextField { textField in
            textField.placeholder = "Число 2"
        }

        let sum = UIAlertAction(title: "Сложить          ", style: .default, handler: { _ in

            guard let firstText = calculatorAlertController.textFields?[0].text,
                  let secondText = calculatorAlertController.textFields?[1].text
            else {
                return
            }

            guard let firstNumber = Int(firstText),
                  let secondNumber = Int(secondText)
            else {
                return
            }

            let result = firstNumber + secondNumber

            let resultAlertController = UIAlertController(
                title: "Ваш результат",
                message: "\(result)",
                preferredStyle: .alert
            )

            self.present(resultAlertController, animated: true)

            resultAlertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
            resultAlertController.addAction(UIAlertAction(title: "Ок", style: .default))
        })

        calculatorAlertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        calculatorAlertController.addAction(sum)

        present(calculatorAlertController, animated: true)
    }
}
