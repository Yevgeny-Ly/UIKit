// ProfileFormData.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель формы "мои данные"
struct ProfileFormData {
    static let numberMaxLength = 11
    var name: String?
    var lastName: String?
    var number: String?
    var footSize: String?
    var dateOfBirth: Date?
    var email: String?

    var formattedPhoneNumber: String? {
        guard var number else { return nil }

        // clearing number
        let pattern = "[\\+\\s-\\(\\)]"
        number = number.replacingOccurrences(of: pattern, with: "", options: .regularExpression)

        // cutting off extra length
        if number.count > ProfileFormData.numberMaxLength {
            number = String(number[..<number.index(
                number.startIndex,
                offsetBy: ProfileFormData.numberMaxLength
            )])
        }

        // formatting number
        if number.count < 7 {
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern,
                with: "$1 ($2) $3",
                options: .regularExpression
            )
        } else {
            let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern,
                with: "$1 ($2) $3-$4-$5",
                options: .regularExpression
            )
        }
        return "+" + number
    }

    var formattedBirthDate: String? {
        guard let dateOfBirth else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.mm.yyyy"
        return dateFormatter.string(from: dateOfBirth)
    }

    var isEmpty: Bool {
        let stringValues = [name, lastName, number, footSize, email]
        let allStringValuesEmpty = stringValues.allSatisfy {
            if let str = $0, !str.isEmpty {
                return false
            }
            return true
        }
        return allStringValuesEmpty && dateOfBirth == nil
    }
}
