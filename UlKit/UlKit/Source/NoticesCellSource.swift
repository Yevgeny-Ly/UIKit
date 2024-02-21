// NoticesCellSource.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Перечисления ячеек
enum NotificationItemType {
    /// Пост с картинкой
    case picture(PictureCellTypealias)
    /// Пост с кнопкой
    case button(ButtonCellTypealias)
}
