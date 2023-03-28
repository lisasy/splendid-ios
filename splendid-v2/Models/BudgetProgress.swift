//
//  BudgetProgress.swift
//  splendid-v2
//
//  Created by Lisa Sy on 3/24/23.
//

import Foundation

struct BudgetProgress: Identifiable {
    let id: UUID
    let category: Category
    let spent: Double
    let budget: Double

    init(category: Category, spent: Double, budget: Double) {
        self.id = UUID()
        self.category = category
        self.spent = spent
        self.budget = budget
    }
    
    var progressFraction: Double {
        spent / budget
    }
}
