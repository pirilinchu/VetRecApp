//
//  AppFont.swift
//  UI
//
//  Created by Santiago Mendoza on 26/2/26.
//


import SwiftUI

public enum AppFont {
    
    case title
    case body
    case small
    
    public var font: Font {
        switch self {
        case .title:
            return .system(size: 24, weight: .bold, design: .default)
        case .body:
            return .system(size: 16, weight: .regular, design: .default)
        case .small:
            return .system(size: 12, weight: .regular, design: .default)
        }
    }
}

public extension Font {
    static func app(_ style: AppFont) -> Font {
        style.font
    }
}
