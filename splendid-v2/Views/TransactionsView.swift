import SwiftUI

struct TransactionsView: View {
    @EnvironmentObject var budgetViewModel: BudgetViewModel
    @State private var isAddTransactionViewPresented = false
    
    let budgetProgressData: [BudgetProgress] = [
          BudgetProgress(category: .groceries, spent: 150, budget: 200),
          BudgetProgress(category: .coffeeShop, spent: 50, budget: 100),
          // Add more categories here
      ]

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
                .foregroundColor(Color("Gray3"))
    
        
            Text("\(todaysTotal)")
                .padding()
                .font(.system(size: 80))
            
            PrimaryButton(action: {
                isAddTransactionViewPresented.toggle()
            }, label: "Add Spending", iconName: "plus")
            .sheet(isPresented: $isAddTransactionViewPresented) {
                AddTransactionView()
                    .environmentObject(budgetViewModel)
            }.padding(.bottom, 12)
            
            VStack {
                MonthCalendarProgressView(date: Date())
                    
                
                VStack {
                    ForEach(budgetProgressData) { progress in
                        BudgetProgressView(budgetProgress: progress)
                            .listRowInsets(EdgeInsets())
                    }
                    Spacer()
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal)
            }
            .background(Color("Gray1"))
            .cornerRadius(32)
            


            // List of cumulative transactions.. Later refactor just for that date
//            List(budgetViewModel.transactions) { transaction in
//                VStack(alignment: .leading) {
//                    Text(transaction.category.rawValue)
//                    Text("\(transaction.amount, specifier: "%.2f")")
//                    Text(transaction.date, style: .date)
//                }
//            }
//            .background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))

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
