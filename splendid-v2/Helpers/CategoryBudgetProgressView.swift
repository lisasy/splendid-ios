//
//  CategoryBudgetProgressView.swift
//  splendid-v2
//
//  Created by Lisa Sy on 3/24/23.
//

import SwiftUI

struct CategoryBudgetProgressView: View {
    var categoryBudget: CategoryBudget
    var spent: Double
    var progress: Double {
        spent / categoryBudget.budget
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryBudget.category.rawValue)
                .font(.headline)
            HStack {
                CategoryProgressBarView(progress: progress, color: .green)
                Text("\(Int(progress * 100))%")
                    .padding(.leading)
            }
        }
    }
}
