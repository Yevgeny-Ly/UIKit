// GameViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class GameViewController: UIViewController {
    var passTheWord: String?

    lazy var inputWordLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.text = "Вы ввели слово"
        label.textColor = .black
        label.font = UIFont(name: "Verdana", size: 16)
        label.sizeToFit()
        return label
    }()

    var writtenWordLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.textColor = .systemGray4
        label.font = UIFont(name: "Verdana", size: 16)
        return label
    }()

    var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "А вот что получится, \n если читать справа налево"
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 16)
        return label
    }()

    var writtenWordReverseLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray4
        label.font = UIFont(name: "Verdana", size: 16)
        return label
    }()

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

    override func viewDidLoad() {
        super.viewDidLoad()
        addsOnView()
        writtenWordLabel.text = passTheWord
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adjustsTheFrame()
    }

    func adjustsTheFrame() {
        inputWordLabel.frame = CGRect(x: 120, y: 106, width: 275, height: 57)
        writtenWordLabel.frame = CGRect(x: 110, y: 163, width: 275, height: 57)
        infoLabel.frame = CGRect(x: 50, y: 282, width: 275, height: 57)
        writtenWordReverseLabel.frame = CGRect(x: 110, y: 339, width: 275, height: 57)
        startButton.frame = CGRect(x: 20, y: 598, width: 335, height: 44)
    }

    func addsOnView() {
        view.backgroundColor = .white
        view.addSubview(inputWordLabel)
        view.addSubview(writtenWordLabel)
        view.addSubview(infoLabel)
        view.addSubview(writtenWordReverseLabel)
        view.addSubview(startButton)
    }

    @objc
    func respondsPressureStartButton() {
        guard let word = passTheWord, !word.isEmpty else {
            return
        }
        let reversed = String(word.reversed())
        writtenWordReverseLabel.text = reversed
    }
}
