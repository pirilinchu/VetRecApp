//
//  HistoryViewModel.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//
import SwiftUI

extension HistoryView {
    @MainActor
    final class ViewModel: ObservableObject {
        private weak var navigator: HistoryNavigating?
        
        @Published var state: State = .loading
        
        private let getMedicationsUseCase: GetMedicationsUseCaseProtocol
        
        init(navigator: HistoryNavigating, getMedicationsUseCase: GetMedicationsUseCaseProtocol) {
            self.navigator = navigator
            self.getMedicationsUseCase = getMedicationsUseCase
        }
        
        func loadData() async {
            if let medications = try? await getMedicationsUseCase.execute(petName: nil) {
                state = .loaded(medications)
            } else {
                state = .loading
            }
        }
        
        func didTapOnMedication(medication: Medication) {
            navigator?.goToDetail(medication: medication)
        }
    }
}

extension HistoryView {
    enum State {
        case loading
        case loaded([Medication])
    }
}
