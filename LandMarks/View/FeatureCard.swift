//
//  FeatureCard.swift
//  LandMarks
//
//  Created by Саша Восколович on 18.03.2025.
//

import SwiftUI

struct FeatureCard: View {
    
    var landmark: Landmark
    
    var body: some View {
        landmark.featuredImage?
            .resizable()
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

#Preview {
    FeatureCard(landmark: ModelData().landmarks[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}

struct TextOverlay: View {
    
    var landmark: Landmark
    
    var gradient: LinearGradient {
        .linearGradient(Gradient(
            colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            gradient
            
            VStack(alignment: .leading) {
                
                Text(landmark.name)
                    .font(.title)
                    .bold()
                
                Text(landmark.park)
                
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}
 
