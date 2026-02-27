//
//  Router.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import SwiftUI

@MainActor
final class Router: ObservableObject {
  @Published var selectedTab: AppTab = .home
  @Published var homePath = NavigationPath()
  @Published var historyPath = NavigationPath()

  // Push helpers
  func push(_ route: HomeRoute) {
    selectedTab = .home
    homePath.append(route)
  }

  func push(_ route: HistoryRoute) {
    selectedTab = .history
    historyPath.append(route)
  }

  func reset(_ tab: AppTab) {
    switch tab {
    case .home: homePath = .init()
    case .history: historyPath = .init()
    }
  }
}
