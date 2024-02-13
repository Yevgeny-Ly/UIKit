// CustomButton.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class CustomButton: UIButton {
    var titleText: String? {
        didSet {
            setTitle(titleText, for: .normal)
            setTitleColor(.white, for: .normal)
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

    func setup() {
        layer.cornerRadius = 12
        frame.size.width = 345
        frame.size.height = 53
        backgroundColor = .specialGreen
    }
}
