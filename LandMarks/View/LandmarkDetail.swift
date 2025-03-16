//
//  LandmarkDetail.swift
//  LandMarks
//
//  Created by Саша Восколович on 16.03.2025.
//

import SwiftUI

struct LandmarkDetail: View {
   
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: mapHeight)
            
            CircleImage(image: landmark.image)
                .offset(y: circleYOffset)
                .padding(.bottom, circlePadding)
        
                
            VStack(alignment: .leading) {
                
                Text(landmark.name)
                    .font(.title)
                
                HStack {
                    
                    Text(landmark.park)
                    
                    Spacer()
                    
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private let mapHeight: CGFloat = 300
    
    private let circlePadding: CGFloat = -130
    private let circleYOffset: CGFloat = -130
}

#Preview {
    LandmarkDetail(landmark: landmarks[0])
}
