//
//  CircleImage.swift
//  LandMarks
//
//  Created by Саша Восколович on 16.03.2025.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        
        image
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(.white, lineWidth: strokeWidth)
            }
            .shadow(radius: shdRadius)
    }
    
    private let shdRadius: CGFloat = 7
    private let strokeWidth: CGFloat = 4
}


#Preview {
    CircleImage(image: Image("turtlerock"))
}
