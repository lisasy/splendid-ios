import SwiftUI

struct BudgetProgressView: View {
    var budgetProgress: BudgetProgress
    
    var body: some View {
        VStack {
            
            MonthProgressView(daysInMonth: 31, daysPassed: 24, fillColor: Color("Gray1"), remainingColor: Color("AccentColor"))
            
            VStack(alignment: .leading) {
                Text(budgetProgress.category.rawValue)
                    .font(.headline)
                    .foregroundColor(Color("Gray2"))
                
                CategoryProgressBarView(progress: budgetProgress.progressFraction, color: Color("Gray1"))
                    .frame(height: 8)
            }
            .padding()
        }
        .background(Color("Gray1"))
        .cornerRadius(16)
        .padding([.horizontal, .bottom])
    }
}

struct BudgetProgressView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetProgressView(budgetProgress: BudgetProgress(category: .groceries, spent: 150, budget: 200))
            .previewLayout(.sizeThatFits)
    }
}
