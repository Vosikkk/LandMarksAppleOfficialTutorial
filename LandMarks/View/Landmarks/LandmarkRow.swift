//
//  LandmarkRow.swift
//  LandMarks
//
//  Created by Саша Восколович on 16.03.2025.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            
            landmark.image
                .resizable()
                .frame(width: imageWidth, height: imageHeight)
                .cornerRadius(radius)
           
            VStack(alignment: .leading) {
                
                Text(landmark.name)
                    .bold()
                
#if !os(watchOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
#endif
            }
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
        .padding(.vertical, padding)
    }
    
    private let padding: CGFloat = 4
    private let imageWidth: CGFloat = 50
    private let imageHeight: CGFloat = 50
    private let radius: CGFloat = 5
    
}

#Preview {
    let landmarks = ModelData().landmarks
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

