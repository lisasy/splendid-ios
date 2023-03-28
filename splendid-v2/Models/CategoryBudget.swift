//
//  CategoryBudget.swift
//  splendid-v2
//
//  Created by Lisa Sy on 3/24/23.
//

import Foundation

struct CategoryBudget: Identifiable {
    let id = UUID()
    var category: Category
    var budget: Double
}
