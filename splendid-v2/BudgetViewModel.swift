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

    private let transactionsKey = "transactions"

    init() {
        self.transactions = loadTransactions()
    }

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
}

