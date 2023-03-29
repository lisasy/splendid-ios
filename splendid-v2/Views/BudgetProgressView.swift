import SwiftUI

struct BudgetProgressView: View {
    var budgetProgress: BudgetProgress
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(budgetProgress.category.rawValue)
                    .font(.headline)
                    .foregroundColor(Color("AccentColor"))
                
                CategoryProgressBarView(progress: budgetProgress.progressFraction, color: Color("Gray3"))
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
