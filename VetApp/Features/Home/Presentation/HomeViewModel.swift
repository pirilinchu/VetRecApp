//
//  HomeViewModel.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//
import SwiftUI

extension HomeView {
    @MainActor
    final class ViewModel: ObservableObject {
        private weak var navigator: HomeNavigating?
        
        @Published var petName: String = ""
        @Published var medicationName: String = ""
        @Published var dosage: String = ""
        @Published var frequency: Medication.MedicationFrequency = .onceDaily
        @Published var notes: String = ""
        @Published var startDate: Date = Date()
        @Published var duration: String = ""
        
        private let saveMedicationUseCase: SaveMedicationUseCaseProtocol
        
        init(navigator: HomeNavigating, saveMedicationUseCase: SaveMedicationUseCaseProtocol) {
            self.navigator = navigator
            self.saveMedicationUseCase = saveMedicationUseCase
        }
        
        func createMedication() {
            Task {
                try? await saveMedicationUseCase.execute(buildMedication())
                cleanData()
                goToMedication()
            }
        }
        
        func goToMedication() {
            navigator?.goToMedication(medication: buildMedication())
        }
        
        func cleanData() {
            petName = ""
            medicationName = ""
            dosage = ""
            frequency = .onceDaily
            notes = ""
            startDate = Date()
            duration = ""
        }
        
        private func buildMedication() -> Medication {
            Medication(
                petName: petName,
                name: medicationName,
                dosage: dosage,
                frequency: frequency,
                notes: notes,
                startDate: startDate,
                duration: duration
            )
        }
    }
}

extension HomeView {
    enum FocusedField {
        case petName
        case medicationName
        case dosage
        case notes
        case duration
    }
}
