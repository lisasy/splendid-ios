import SwiftUI

struct TransactionsView: View {
    @EnvironmentObject var budgetViewModel: BudgetViewModel
    @State private var isAddTransactionViewPresented = false

    private var todaysTotal: String {
        let today = Calendar.current.startOfDay(for: Date())
        let total = budgetViewModel.transactions
            .filter { Calendar.current.isDate($0.date, inSameDayAs: today) }
            .map { $0.amount }
            .reduce(0, +)
        return total == 0 ? String(format: "$%.0f", total) : String(format: "$%.2f", total)
    }

    var body: some View {
        VStack {
            Text("It's \(Date(), style: .date)")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.top, 64.0)

            
            Text("Spent today")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(Color("Gray2"))
    
        
            Text("\(todaysTotal)")
                .padding()
                .font(.system(size: 80))
            
            PrimaryButton(action: {
                isAddTransactionViewPresented.toggle()
            }, label: "Add Spending", iconName: "plus")


            List(budgetViewModel.transactions) { transaction in
                VStack(alignment: .leading) {
                    Text(transaction.category.rawValue)
                    Text("\(transaction.amount, specifier: "%.2f")")
                    Text(transaction.date, style: .date)
                }
            }
            .background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
            .sheet(isPresented: $isAddTransactionViewPresented) {
                AddTransactionView()
                    .environmentObject(budgetViewModel)
            }
        }
        .background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
        .foregroundColor(Color("AccentColor"))
        
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
            .environmentObject(BudgetViewModel())
    }
}
