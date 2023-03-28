//
//  CategoryProgressBarView.swift
//  splendid-v2
//
//  Created by Lisa Sy on 3/24/23.
//

import SwiftUI

struct CategoryProgressBarView: View {
    var progress: Double
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 4)
                .fill(color)
                .frame(width: geometry.size.width * CGFloat(progress))
        }
    }
}
