//
//  LandmarkList.swift
//  LandMarks
//
//  Created by Саша Восколович on 16.03.2025.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var showFavoritesOnly: Bool = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter {
            (!showFavoritesOnly || $0.isFavorite)
        }
    }
    
    var body: some View {
        
        NavigationSplitView {
            
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
            
        } detail: {
            Text("Select a landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
