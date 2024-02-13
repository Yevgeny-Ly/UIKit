// CustomButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Базовая кнопка с жирным шрифтом и зеленым цветом
final class CustomButton: UIButton {
    var titleText: String? {
        didSet {
            setAttributedTitle(NSAttributedString(string: titleText ?? "", attributes: [
                .font: UIFont.verdanaBold18() ?? UIFont.boldSystemFont(ofSize: 18),
                .foregroundColor: UIColor.white
            ]), for: .normal)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    private func setup() {
        layer.cornerRadius = 12
        frame.size.width = 345
        frame.size.height = 53
        backgroundColor = .specialGreen
    }
}
