//
//  AppColor.swift
//  UI
//
//  Created by Santiago Mendoza on 26/2/26.
//


import SwiftUI

public enum AppColor {
    
    case primaryText
    case secondaryText
    case primary
    case secondary
    case error
    
    public var color: Color {
        switch self {
        case .primaryText:
            return Color.primary
        case .secondaryText:
            return Color.secondary
        case .primary:
            return Color.blue
        case .secondary:
            return Color.gray
        case .error:
            return Color.red
        }
    }
}

public extension Color {
    static func app(_ color: AppColor) -> Color {
        color.color
    }
}
