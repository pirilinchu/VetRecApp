//
//  DeleteMedicationUseCase.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import Foundation

protocol DeleteMedicationUseCaseProtocol {
    func execute(id: String) async throws
}

struct DeleteMedicationUseCase: DeleteMedicationUseCaseProtocol {
  let repo: MedicationsRepositoryProtocol

  func execute(id: String) async throws {
    try await repo.remove(id: id)
  }
}
