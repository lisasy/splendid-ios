//
//  Transaction.swift
//  splendid-v2
//
//  Created by Lisa Sy on 3/20/23.
//

import Foundation

struct Transaction: Identifiable, Codable {
    let id: UUID
    let category: Category
    let amount: Double
    let date: Date
}

enum Category: String, CaseIterable, Codable {
    case groceries = "Groceries"
    case eatingOut = "Dine Out"
    case coffeeShop = "Coffee & Tea"
    case pet = "Pet"
}
