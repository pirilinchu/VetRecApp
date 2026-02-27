//
//  MedicationViewModel.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//
import SwiftUI

extension MedicationView {
    @MainActor
    final class ViewModel: ObservableObject {
        private weak var navigator: MedicationNavigating?
        let medication: Medication
        
        private let deleteMedicationUseCase: DeleteMedicationUseCaseProtocol
        
        init(navigator: MedicationNavigating, medication: Medication, deleteMedicationUseCase: DeleteMedicationUseCaseProtocol) {
            self.deleteMedicationUseCase = deleteMedicationUseCase
            self.navigator = navigator
            self.medication = medication
        }
        
        func delete() {
            Task {
                try? await deleteMedicationUseCase.execute(id: medication.id.uuidString)
                navigator?.popToRoot()
            }
        }
        
        func exportToPDF() {
            // TODO: The best approach is not the pdf or image. We should be sharing a universal link of the Medication that can be handled on the pet owner app and route to the detail. For that a handler is needed on the Router to parse a url into a Route on the app, also a openURL task on the Root. Too late for this haha
        }
    }
}
