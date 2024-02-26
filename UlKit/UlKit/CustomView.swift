// CustomView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class CustomView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
    }
}
