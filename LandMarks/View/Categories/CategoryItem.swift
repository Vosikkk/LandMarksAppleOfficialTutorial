//
//  CategoryItem.swift
//  LandMarks
//
//  Created by Саша Восколович on 17.03.2025.
//

import SwiftUI

struct CategoryItem: View {
    
    var landmark: Landmark
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: imageWidth, height: imageHeight)
                .cornerRadius(radius)
            
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, padding)
    }
    
    private let imageWidth: CGFloat = 155
    private let imageHeight: CGFloat = 155
    
    private let radius: CGFloat = 5
    
    private let padding: CGFloat = 15
}

#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
