//
//  SaveMedicationUseCaseMock.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

#if DEBUG
import Foundation

struct SaveMedicationUseCaseMock: SaveMedicationUseCaseProtocol {
    let repo: MedicationsRepositoryProtocol = MedicationsRepository(store: MedicationsStoreMock())
    
    func execute(_ medication: Medication) async throws {}
}
#endif
