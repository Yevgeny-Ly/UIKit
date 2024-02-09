// StartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// описывает начальный экран приложения
class StartViewController: UIViewController {
    // MARK: - Private closure
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.2979461551, green: 0.8465514779, blue: 0.399361372, alpha: 1)
        button.setTitle("Начать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        button.addTarget(self, action: #selector(respondsPressureStartButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addsOnView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustsTheFrame()
    }

    // MARK: - Private method
    
    func adjustsTheFrame() {
        startButton.frame = CGRect(x: 20, y: 406, width: 335, height: 44)
    }

    func addsOnView() {
        view.backgroundColor = .white
        view.addSubview(startButton)
    }

    // MARK: - @objc method
    
    @objc
    func respondsPressureStartButton() {
        let alertController = UIAlertController(
            title: "Введите ваше слово",
            message: nil,
            preferredStyle: .alert
        )

        alertController.addTextField { textField in
            textField.placeholder = "Введите слово"
        }

        alertController.addAction(UIAlertAction(title: "Ок", style: .default) { _ in
            if let textField = alertController.textFields?.first, let inputWord = textField.text {
                let gameviewController = GameViewController()
                gameviewController.passTheWord = inputWord
                gameviewController.modalPresentationStyle = .fullScreen
                self.present(gameviewController, animated: true)
            }
        })

        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(alertController, animated: true)
    }
}
