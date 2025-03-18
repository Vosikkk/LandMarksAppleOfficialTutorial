//
//  Profile.swift
//  LandMarks
//
//  Created by Саша Восколович on 18.03.2025.
//

import Foundation

struct Profile {
    
    var username: String
    var prefersNotifications: Bool = true
    var seasonalPhoto: Season = .winter
    var goalDate: Date = Date()
    
    static let `default` = Profile(username: "test_q")
    
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
