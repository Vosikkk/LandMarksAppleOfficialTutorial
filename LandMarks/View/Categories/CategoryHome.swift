//
//  CategoryHome.swift
//  LandMarks
//
//  Created by Саша Восколович on 17.03.2025.
//

import SwiftUI

struct CategoryHome: View {
    
    @Environment(ModelData.self) private var modelData
    
    @State private var showingProfile: Bool = false
    
    var body: some View {
        
        NavigationSplitView {
            
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: featuredImageHeight)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
            
        } detail: {
            Text("Select a Landmark")
        }
    }
    
    private let featuredImageHeight: CGFloat = 200
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
