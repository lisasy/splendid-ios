//
//  PrimaryButton.swift
//  splendid-v2
//
//  Created by Lisa Sy on 3/24/23.
//

import SwiftUI

struct PrimaryButton: View {
    var action: () -> Void
    let label: String
    let iconName: String?
    
    init(action: @escaping () -> Void, label: String, iconName: String? = nil) {
        self.action = action
        self.label = label
        self.iconName = iconName
    }

    
    var body: some View {
        Button(action: action) {
            HStack {
                 if let iconName = iconName {
                     Image(systemName: iconName)
                 }
                 Text(label)
                    .fontWeight(.medium)
             }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .buttonStyle(PrimaryButtonStyle())
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? Color("Gray1").opacity(0.7) : Color("Gray1"))
            .foregroundColor(Color("Gray3"))
            .cornerRadius(12)
            .font(.system(size: configuration.isPressed ? 14 : 16))
    }
}

    
struct StylizedButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            PrimaryButton(action: {}, label: "Add Transaction", iconName: "plus")
            PrimaryButton(action: {}, label: "Submit")
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
