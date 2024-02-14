// UIFont+Verdana.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Extension UIFont для удобной работы со шрифтом Verdana
extension UIFont {
    /// fontWeight: normal
    static func verdana(ofSize size: CGFloat) -> UIFont? {
        UIFont(name: "Verdana", size: size)
    }

    /// fontWeight: bold
    static func verdanaBold(ofSize size: CGFloat) -> UIFont? {
        UIFont(name: "Verdana-Bold", size: size)
    }
}
