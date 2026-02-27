//
//  HistoryNavHost.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import SwiftUI

struct HistoryNavHost: View {
    let container: AppContainer
    @ObservedObject private var router: Router

    init(container: AppContainer) {
      self.container = container
      self._router = ObservedObject(wrappedValue: container.router)
    }
    
    var body: some View {
        NavigationStack(path: $router.historyPath) {
            HistoryView(viewModel: container.makeHistoryViewModel())
                .navigationDestination(for: HistoryRoute.self) { route in
                    switch route {
                    case .detail(let medication):
                        MedicationView(viewModel: container.makeMedicationViewModel(with: medication))
                    }
                }
        }
    }
}
