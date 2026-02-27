//
//  SaveMedicationUseCase.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import Foundation

protocol SaveMedicationUseCaseProtocol {
    func execute(_ medication: Medication) async throws
}

struct SaveMedicationUseCase: SaveMedicationUseCaseProtocol {
    let repo: MedicationsRepositoryProtocol
    
    func execute(_ medication: Medication) async throws {
        try await repo.save(medication)
    }
}
