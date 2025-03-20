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
            
            VStack(alignment: .leading, spacing: vLeadSpacing) {
                
                HStack(spacing: hSpacing) {
                    
                    CircleImage(image: landmark.image.resizable())
                        .frame(
                            width: circleImageWidth,
                            height: circleImageHeight
                        )
                    
                    
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
            .frame(maxWidth: maxWidth)
            .offset(y: offset)
        }
        .navigationTitle(landmark.name)
    }
    
    private let mapHeight: CGFloat = 300
    
    private let circleImageWidth: CGFloat = 160
    private let circleImageHeight: CGFloat = 160
    
    private let offset: CGFloat = -50
    
    private let vLeadSpacing: CGFloat = 20
    
    private let hSpacing: CGFloat = 24
    
    private let maxWidth: CGFloat = 700
    
}

#Preview {
    
    let modelData = ModelData()
    
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
        .frame(width: 850, height: 700)
}
