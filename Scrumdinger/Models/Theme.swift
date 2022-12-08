//
//  Theme.swift
//  Scrumdinger
//
//  Created by Jan Kaiponen on 7.12.2022.
//

import SwiftUI

enum Theme: String, CaseIterable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var name : String {
        self.rawValue.capitalized
    }
    var accentColor: Color {
        switch self {
            case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
            case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    
    var mainColor: Color {
        Color(self.rawValue)
    }
}
