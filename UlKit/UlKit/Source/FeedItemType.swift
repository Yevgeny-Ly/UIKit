// FeedItemType.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Перечисления с вариантами постов
enum FeedItemType {
    ///  Истории
    case stories(StoriesSourceTypealias)
    /// Посты
    case post(PostsSourceTypealias)
    /// Рекомендации
    case recommendations(RecommendationsCellTypealias)
}
