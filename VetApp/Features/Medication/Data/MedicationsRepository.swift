//
//  MedicationsRepository.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//


import Foundation

protocol MedicationsRepositoryProtocol {
    func save(_ medication: Medication) async throws
    func remove(id: String) async throws
    func medications() async throws -> [Medication]
    func medications(for petName: String) async throws -> [Medication]
    func medication(id: String) async throws -> Medication?
}

final class MedicationsRepository: MedicationsRepositoryProtocol {
    private let store: MedicationsStoreProtocol
    
    init(store: MedicationsStoreProtocol) {
        self.store = store
    }
    
    func save(_ medication: Medication) async throws {
        try await store.upsert(medication)
    }
    
    func remove(id: String) async throws {
        try await store.delete(id: id)
    }
    
    func medications() async throws -> [Medication] {
        try await store.fetchAll()
    }
    
    func medications(for petName: String) async throws -> [Medication] {
        try await store.fetchByPetName(petName)
    }
    
    func medication(id: String) async throws -> Medication? {
        try await store.fetch(id: id)
    }
}
