//
//  LandmarksDetail.swift
//  MacLandmarks
//
//  Created by Саша Восколович on 19.03.2025.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    
    @Environment(ModelData.self) private var modelData
   
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        ScrollView {
            
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: mapHeight)
                
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                
                HStack(spacing: 24) {
                    
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)
                    
                    
                    VStack(alignment: .leading) {
                        HStack {
                            
                            Text(landmark.name)
                                .font(.title)
                            FavoriteButton(
                                isSet: $modelData.landmarks[landmarkIndex].isFavorite
                            )
                            .buttonStyle(.plain)
                        }
                        
                        
                        VStack(alignment: .leading) {
                            
                            Text(landmark.park)
                            
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                }
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
    
    private let mapHeight: CGFloat = 300
    
    private let circlePadding: CGFloat = -130
    private let circleYOffset: CGFloat = -130
}

#Preview {
    
    let modelData = ModelData()
    
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
        .frame(width: 850, height: 700)
}
