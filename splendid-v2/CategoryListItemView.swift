//
//  CategoryListItemView.swift
//  splendid-v2
//
//  Created by Lisa Sy on 3/24/23.
//

import SwiftUI

struct CategoryListItemView: View {
    let category: Category
    @Binding var isSelected: Bool
    @Binding var selectedCategory: Category
    @Binding var foregroundColor: Color
    
    var body: some View {
        HStack {
            Text(category.rawValue)
                .foregroundColor(isSelected ? foregroundColor : Color("Gray3"))
            
            Spacer()
            
            if category == selectedCategory {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(foregroundColor)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 12)
       
        .font(.system(size: 16))
        .contentShape(Rectangle())
        .onTapGesture {
            selectedCategory = category
        }
        .background(isSelected ? Color("Shadow") : Color("Gray1"))
        .cornerRadius(8)
    }
}

