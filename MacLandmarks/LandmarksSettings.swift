//
//  LandmarksSettings.swift
//  MacLandmarks
//
//  Created by Саша Восколович on 20.03.2025.
//

import SwiftUI

struct LandmarksSettings: View {
    
    @AppStorage("MapView.zoom")
    private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        
        Form {
            
            Picker("Map Zoom", selection: $zoom) {
                
                ForEach(MapView.Zoom.allCases) {
                    
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: width)
        .navigationTitle("Landmark Settings")
        .padding(padding)
    }
    
    private let padding: CGFloat = 80
    private let width: CGFloat = 300
}

#Preview {
    LandmarksSettings()
}
