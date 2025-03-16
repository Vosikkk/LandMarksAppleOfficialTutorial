//
//  LandmarkDetail.swift
//  LandMarks
//
//  Created by Саша Восколович on 16.03.2025.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @Environment(ModelData.self) private var modelData
   
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        ScrollView {
            
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: mapHeight)
            
            CircleImage(image: landmark.image)
                .offset(y: circleYOffset)
                .padding(.bottom, circlePadding)
        
                
            VStack(alignment: .leading) {
                HStack {
                    
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(
                        isSet: $modelData.landmarks[landmarkIndex].isFavorite
                    )
                }
                
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
    LandmarkDetail(landmark: ModelData().landmarks[0])
        .environment(ModelData())
}
