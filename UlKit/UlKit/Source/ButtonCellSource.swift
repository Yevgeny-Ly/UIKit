// ButtonCellSource.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Источник данных для ячейки с кнопкой
struct ButtonCellSource {
    /// Аватарка пользователя
    let avatarName: String
    /// Название кнопки
    let buttonTitle: String
    /// Комментарий пользователя
    let comment: СommentaryInformation?

    /// Источник данных для подраздела комментарии
    struct СommentaryInformation {
        /// Имя пользователя в комментариях
        let nameUser: String
        /// Комментарий пользователя
        let commentText: String
    }
}

typealias ButtonCellTypealias = [ButtonCellSource]
