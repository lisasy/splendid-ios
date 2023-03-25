import SwiftUI

struct AddTransactionView: View {
    @EnvironmentObject var budgetViewModel: BudgetViewModel
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) private var dismiss
    @State private var selectedCategory: Category = .groceries
    @State private var amount: String = ""
    @State private var isCategoryPickerPresented: Bool = false
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        Section {
                            TextField("$0", text: $amount)
                                .keyboardType(.decimalPad)
                                .padding()
                                .font(.system(size: 80))
                                .multilineTextAlignment(.center)
                                .background(Color.clear)
                                .foregroundColor(Color("AccentColor"))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                        
                        
                        PrimaryButton(action: {
                            isCategoryPickerPresented = true
                        }, label: (selectedCategory.rawValue), iconName: "chevron.down")
                        .sheet(isPresented: $isCategoryPickerPresented) {
                            NavigationView {
                                VStack {
                                    VStack {
                                        ForEach(Category.allCases, id: \.self) { category in
                                            CategoryListItemView(
                                                category: category,
                                                isSelected: Binding(
                                                    get: { selectedCategory == category },
                                                    set: { if $0 { selectedCategory = category }}
                                                ),
                                                selectedCategory: $selectedCategory,
                                                foregroundColor: .constant(Color("AccentColor"))
                                            )
                                        }
                                        
                                    }
                                    .background(Color("Gray1"))
                                
                                    
                                     Spacer()
                                    PrimaryButton(action: {
                                        isCategoryPickerPresented.toggle()
                                    }, label: "Done")
                                }
                                .padding(12)
                                .background(Color("Gray1"))
                            }
                            .presentationDetents([.height(400)])
                    
                        }
                        
                    }
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if let amount = Double(amount) {
                            budgetViewModel.addTransaction(category: selectedCategory, amount: amount, date: Date())
                            presentationMode.wrappedValue.dismiss()
                        }
                        dismiss()
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
