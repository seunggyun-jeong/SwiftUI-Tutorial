//
//  Profile.swift
//  Landmarks
//
//  Created by μ μΉκ·  on 2022/05/30.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "π·"
        case summer = "π"
        case autumn = "π"
        case winter = "βοΈ"

        var id: String { rawValue }
    }
}
