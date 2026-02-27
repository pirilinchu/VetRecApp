//
//  RootTabsView.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import SwiftUI

struct RootTabsView: View {
    @StateObject private var router = Router()
    @StateObject private var container: AppContainer
    
    init() {
        let router = Router()
        _router = StateObject(wrappedValue: router)
        _container = StateObject(wrappedValue: AppContainer(router: router))
    }
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            HomeNavHost(container: container)
                .tabItem { Label("Home", systemImage: "house") }
                .tag(AppTab.home)
            
            HistoryNavHost(container: container)
                .tabItem { Label("History", systemImage: "clock") }
                .tag(AppTab.history)
        }
    }
}
