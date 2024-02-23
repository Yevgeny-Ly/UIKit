// StoriesCellSource.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Источник данных для историй
struct StoriesCellSource {
    /// Аватарка пользователя
    let avatarImage: String
    /// Имя пользователя
    let nameUser: String
    ///  Добавлять ли кнопку
    let isAddStoriesButton: Bool
    ///  Добавлять ли историю
    let isNewStory: Bool
}

typealias StoriesSourceTypealias = [StoriesCellSource]
