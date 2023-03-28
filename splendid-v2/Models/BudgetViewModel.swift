//
//  BudgetViewModel.swift
//  splendid-v2
//
//  Created by Lisa Sy on 3/20/23.
//

import SwiftUI
import Combine

class BudgetViewModel: ObservableObject {
    @Published private(set) var transactions: [Transaction] = [] {
        didSet {
            saveTransactions()
        }
    }
    
    @Published var categoriesBudget: [CategoryBudget] = [
        CategoryBudget(category: .groceries, budget: 200),
        CategoryBudget(category: .coffeeShop, budget: 100),
        CategoryBudget(category: .eatingOut, budget: 300),
        CategoryBudget(category: .pet, budget: 400),
    ]
    
    private let transactionsKey = "transactions"

    init() {
        self.transactions = loadTransactions()
    }
    
    
    // Add, Save, Load Transactions
    func addTransaction(category: Category, amount: Double, date: Date) {
        let transaction = Transaction(id: UUID(), category: category, amount: amount, date: date)
        transactions.append(transaction)
    }

    private func saveTransactions() {
        if let encodedTransactions = try? JSONEncoder().encode(transactions) {
            UserDefaults.standard.set(encodedTransactions, forKey: transactionsKey)
        }
    }

    private func loadTransactions() -> [Transaction] {
        if let data = UserDefaults.standard.data(forKey: transactionsKey),
           let decodedTransactions = try? JSONDecoder().decode([Transaction].self, from: data) {
            return decodedTransactions
        }
        return []
    }
    
    // Add, Remove, Edit Categories
    func addCategoryBudget(category: Category, budget: Double) {
        categoriesBudget.append(CategoryBudget(category: category, budget: budget))
    }
    
    func removeCategoryBudget(at offsets: IndexSet) {
        categoriesBudget.remove(atOffsets: offsets)
    }
    
    func updateCategoryBudget(id: UUID, newBudget: Double) {
        if let index = categoriesBudget.firstIndex(where: { $0.id == id }) {
            categoriesBudget[index].budget = newBudget
        }
    }
    
}

