//
//  HomeNavHost.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import SwiftUI

struct HomeNavHost: View {
    let container: AppContainer
    @ObservedObject private var router: Router

    init(container: AppContainer) {
      self.container = container
      self._router = ObservedObject(wrappedValue: container.router)
    }
    
    var body: some View {
        NavigationStack(path: $router.homePath) {
            HomeView(viewModel: container.makeHomeViewModel())
                .navigationDestination(for: HomeRoute.self) { route in
                    switch route {
                    case .something:
                        Text("something")
                    }
                }
        }
    }
}
