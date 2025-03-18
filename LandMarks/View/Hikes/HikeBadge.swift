//
//  HikeBadge.swift
//  LandMarks
//
//  Created by Саша Восколович on 18.03.2025.
//

import SwiftUI

struct HikeBadge: View {
    
    var name: String
    
    var body: some View {
        
        VStack(alignment: .center) {
            Badge()
                .frame(width: initialWidth, height: initialHeight)
                .scaleEffect(scale)
                .frame(width: finalWidth, height: finalHeight)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for: \(name).")
        }
    }
    
    private var scale: Double {
        1.0 / 3.0
    }
    
    private let initialWidth: CGFloat = 300
    private let initialHeight: CGFloat = 300
    
    private let finalWidth: CGFloat = 100
    private let finalHeight: CGFloat = 100
}

#Preview {
    HikeBadge(name: "Preview Testing")
}
