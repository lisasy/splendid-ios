//
//  MonthProgressView.swift
//  splendid-v2
//
//  Created by Lisa Sy on 3/24/23.
//

import SwiftUI

// this needs to input the current month

struct MonthProgressView: View {
    let daysInMonth: Int
    let daysPassed: Int
    let fillColor: Color
    let remainingColor: Color
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<daysInMonth) { day in
                RoundedRectangle(cornerRadius: 1)
                    .fill(day < daysPassed ? fillColor : remainingColor)
                    .frame(width: 2)
            }
        }
    }
}
