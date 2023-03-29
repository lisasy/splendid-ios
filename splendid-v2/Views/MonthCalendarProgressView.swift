//
//  MonthCalendarProgressView.swift
//  splendid-v2
//
//  Created by Lisa Sy on 3/24/23.
//

import Foundation
import SwiftUI

struct MonthCalendarProgressView: View {
    let date: Date
    
    var currentMonth: String {
        let now = Date()
        let thisMonth = Calendar.current.component(.month, from: now)
        
        let components = DateComponents(month: thisMonth)
        let monthDate = Calendar.current.date(from: components) ?? now
        
        return monthDate.formatted(.dateTime.month(.wide))
    }
    
    var daysInMonth: Int {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    var daysPassed: Int {
        let now = Date()
        let calendar = Calendar.current
        let currentDay = calendar.component(.day, from: now)
        return currentDay - 1
    }

    var daysRemaining: Int {
        daysInMonth - daysPassed
    }
    
    var lastDateInMonth: Int {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.year, .month], from: now)
        
        guard let startOfMonth = calendar.date(from: components),
                 let range = calendar.range(of: .day, in: .month, for: startOfMonth) else {
               return 0
           }
           
        return range.upperBound - 1
    }
    
    var fillColor: Color = Color("Gray2")
    var remainingColor: Color = Color("AccentColor")
    
    var body: some View {
        VStack {
            Text("\(daysRemaining) days left")
                .foregroundColor(Color("AccentColor"))
                .font(.system(size: 24))
                .fontWeight(.medium)
                
            HStack {
                Text("1")
 
                Spacer()
                Text("Until end of \(currentMonth)")

                    
                Spacer()
                Text("\(lastDateInMonth)")
            }
            .foregroundColor(Color("Gray3"))
            .fontWeight(.medium)
            
            
            GeometryReader { geometry in
                HStack(spacing: 2) {
                    ForEach(1...daysInMonth, id: \.self) { day in
                        RoundedRectangle(cornerRadius: 2)
                            .frame(width: (geometry.size.width - CGFloat(daysInMonth - 1) * 2) / CGFloat(daysInMonth), height: 24)
                            .foregroundColor(day <= daysPassed ? fillColor : remainingColor)
                    }
                }
            }

        }
        .padding(.vertical, 32)
        .padding(.horizontal, 24)
    }
}
