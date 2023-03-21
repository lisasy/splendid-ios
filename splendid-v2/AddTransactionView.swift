import SwiftUI

struct AddTransactionView: View {
    @EnvironmentObject var budgetViewModel: BudgetViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedCategory: Category = .groceries
    @State private var amount: String = ""

    var body: some View {
        NavigationView {
            Form {
                Picker("Category", selection: $selectedCategory) {
                    ForEach(Category.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add Transaction")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if let amount = Double(amount) {
                            budgetViewModel.addTransaction(category: selectedCategory, amount: amount, date: Date())
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView()
            .environmentObject(BudgetViewModel())
    }
}
