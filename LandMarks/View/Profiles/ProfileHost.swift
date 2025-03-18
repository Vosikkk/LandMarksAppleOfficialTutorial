//
//  ProfileHost.swift
//  LandMarks
//
//  Created by Саша Восколович on 18.03.2025.
//

import SwiftUI

struct ProfileHost: View {
    
    @State private var draftProfile: Profile = Profile.default
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: spacing) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
    
    private let spacing: CGFloat = 20
}

#Preview {
    ProfileHost()
}
