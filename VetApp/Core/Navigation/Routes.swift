//
//  Routes.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//
import Foundation

enum AppTab: Hashable {
    case home
    case history
}

enum HomeRoute: Hashable {
    case something
}

enum HistoryRoute: Hashable {
    case detail(Medication)
}
