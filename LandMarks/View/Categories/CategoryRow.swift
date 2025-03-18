//
//  CategoryRow.swift
//  LandMarks
//
//  Created by Саша Восколович on 17.03.2025.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(categoryName)
                .font(.headline)
                .padding(.leading, leadPadding)
                .padding(.top, topPadding)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(alignment: .top, spacing: hSpacing) {
                    
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: scrollHeight)
        }
    }
    
    private let leadPadding: CGFloat = 15
    private let topPadding: CGFloat = 5
    
    private let hSpacing: CGFloat = 0
    
    private let scrollHeight: CGFloat = 185
}

#Preview {
    let landmarks = ModelData().landmarks
    
    return CategoryRow(categoryName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(4)))
}
