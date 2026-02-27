//
//  GetMedicationsUseCase.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import Foundation

protocol GetMedicationsUseCaseProtocol {
    func execute(petName: String?) async throws -> [Medication]
}

struct GetMedicationsUseCase: GetMedicationsUseCaseProtocol {
    let repo: MedicationsRepositoryProtocol
    
    func execute(petName: String? = nil) async throws -> [Medication] {
        if let petName { return try await repo.medications(for: petName) }
        return try await repo.medications()
    }
}
