// RecommendationsCellSource.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Источник данных для рекомендаций
struct RecommendationsCellSource {
    /// Аватарка пользователя
    let imageUser: String
    /// Имя пользователя
    let nameUser: String
}

typealias RecommendationsCellTypealias = [RecommendationsCellSource]
