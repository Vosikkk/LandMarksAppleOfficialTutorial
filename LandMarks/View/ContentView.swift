//
//  ContentView.swift
//  LandMarks
//
//  Created by Саша Восколович on 16.03.2025.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        
        VStack {
            
            MapView()
                .frame(height: mapHeight)
            
            CircleImage()
                .offset(y: circleYOffset)
                .padding(.bottom, circlePadding)
        
                
            VStack(alignment: .leading) {
                
                Text("Turtle Rock")
                    .font(.title)
                
                HStack {
                    
                    Text("Joshua Tree National Park")
                    
                    Spacer()
                    
                    Text("California")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                
                Text("Discriptive text goes here")
            }
            
            .padding()
            
            Spacer()
        }
    }
    
    private let mapHeight: CGFloat = 300
    
    private let circlePadding: CGFloat = -130
    private let circleYOffset: CGFloat = -130
}

#Preview {
    ContentView()
}
