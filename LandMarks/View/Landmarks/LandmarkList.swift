//
//  LandmarkList.swift
//  LandMarks
//
//  Created by Саша Восколович on 16.03.2025.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) private var modelData
    
    @State private var showFavoritesOnly: Bool = false
    
    @State private var filter: FilterCategory = .all
    
    @State private var selectedLandmark: Landmark?
    
   
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        NavigationSplitView {
            
            List(selection: $selectedLandmark) {
                
                ForEach(filteredLandmarks) { landmark in
                    
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(title)
            .frame(minWidth: minWidth)
            
            .toolbar {
                ToolbarItem {
                    Menu {
                        
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue)
                                    .tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Text("Favorites Only")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            
        } detail: {
            Text("Select a landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
    
    private let minWidth: CGFloat = 300
}


extension LandmarkList {
   
    enum FilterCategory: String, CaseIterable, Identifiable {
        
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: Self { self }
    }
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite) &&
            (filter == .all || filter.rawValue == landmark.category.rawValue )
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
}



#Preview {
    LandmarkList()
        .environment(ModelData())
}
