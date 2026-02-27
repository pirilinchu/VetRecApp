//
//  AppContainer.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import SwiftUI
import RealmSwift

@MainActor
final class AppContainer: ObservableObject {
    let router: Router
    
    // Realm configuration (migrations here)
    private lazy var realmConfig: Realm.Configuration = {
        var config = Realm.Configuration(schemaVersion: 1)
        config.migrationBlock = { _, _ in }
        return config
    }()
    
    // Stores
    private lazy var medicationsStore: MedicationsStoreProtocol =
    MedicationsStore(configuration: realmConfig)
    
    // Repos
    private lazy var medicationsRepo: MedicationsRepositoryProtocol =
    MedicationsRepository(store: medicationsStore)
    
    // Use cases
    lazy var saveMedicationUseCase = SaveMedicationUseCase(repo: medicationsRepo)
    lazy var getMedicationsUseCase = GetMedicationsUseCase(repo: medicationsRepo)
    lazy var deleteMedicationUseCase = DeleteMedicationUseCase(repo: medicationsRepo)
    
    init(router: Router) {
        self.router = router
        // self.api = APIClient()
        // self.realmStore = RealmPostsStore(...)
    }
    
    func makeHomeViewModel() -> HomeView.ViewModel {
        .init(navigator: router, saveMedicationUseCase: saveMedicationUseCase)
    }
    
    func makeHistoryViewModel() -> HistoryView.ViewModel {
        .init(navigator: router, getMedicationsUseCase: getMedicationsUseCase)
    }
    
    func makeMedicationViewModel(with medication: Medication) -> MedicationView.ViewModel {
        .init(navigator: router, medication: medication, deleteMedicationUseCase: deleteMedicationUseCase)
    }
}
