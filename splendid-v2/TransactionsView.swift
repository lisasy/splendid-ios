import SwiftUI

struct TransactionsView: View {
    @EnvironmentObject var budgetViewModel: BudgetViewModel


    private var todaysTotal: Double {
        let today = Calendar.current.startOfDay(for: Date())
        return budgetViewModel.transactions
            .filter { Calendar.current.isDate($0.date, inSameDayAs: today) }
            .map { $0.amount }
            .reduce(0, +)
    }

    var body: some View {
        VStack {
            Text("Today's total: \(todaysTotal, specifier: "%.2f")")
                .font(.headline)
                .padding()
            
            
            Text("Today: \(Date(), style: .date)")
                .font(.subheadline)
                .padding()


            List(budgetViewModel.transactions) { transaction in
                VStack(alignment: .leading) {
                    Text(transaction.category.rawValue)
                    Text("\(transaction.amount, specifier: "%.2f")")
                    Text(transaction.date, style: .date)
                }
            }
            .navigationTitle("Transactions")
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
            .environmentObject(BudgetViewModel())
    }
}
