//
//  ProfileHost.swift
//  LandMarks
//
//  Created by Саша Восколович on 18.03.2025.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    
    @State private var draftProfile: Profile = Profile.default
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: spacing) {
            
            HStack {
                
                if editMode?.wrappedValue == .active {
                    
                    Button("Cancel", role: .cancel) {
                        
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                
                ProfileSummary(profile: modelData.profile)
                
            } else {
                
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
    
    private let spacing: CGFloat = 20
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
