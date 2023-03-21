import SwiftUI

struct ContentView: View {
    @StateObject private var budgetViewModel = BudgetViewModel()
    @State private var isShowingAddTransactionView = false

    var body: some View {
        NavigationView {
            TransactionsView()
                .environmentObject(budgetViewModel)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button(action: { isShowingAddTransactionView.toggle() }) {
                            Image(systemName: "plus")
                        }
                    }
                }
        }
        .sheet(isPresented: $isShowingAddTransactionView) {
            AddTransactionView()
                .environmentObject(budgetViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
