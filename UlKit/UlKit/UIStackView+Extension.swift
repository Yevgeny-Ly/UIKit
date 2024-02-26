// UIStackView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для удобной работы с UiStackView
extension UIStackView {
    /// инициализатор для UiView
    convenience init(arrangedsSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedsSubviews)
        /// ориентации
        self.axis = axis
        /// расстояния
        self.spacing = spacing
        /// расположение по центру
        alignment = .center
        /// работа с констрейнтами
        translatesAutoresizingMaskIntoConstraints = false
    }
}
