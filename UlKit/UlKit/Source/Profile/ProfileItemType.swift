// ProfileItemType.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Перечисления с вариантами ячеек
enum ProfileItemType {
    ///  Шапка профиля
    case header
    /// Истории
    case stories(PostStoriesTypealias)
    /// Лента
    case feed(ProfileFeedTypealias)
}
