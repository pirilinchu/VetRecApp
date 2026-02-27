//
//  MedicationsStore.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//


import Foundation
import RealmSwift

protocol MedicationsStoreProtocol {
  func upsert(_ medication: Medication) async throws
  func delete(id: String) async throws
  func fetchAll() async throws -> [Medication]
  func fetchByPetName(_ petName: String) async throws -> [Medication]
  func fetch(id: String) async throws -> Medication?
}

actor MedicationsStore: MedicationsStoreProtocol {
    private let configuration: Realm.Configuration
    
    init(configuration: Realm.Configuration = .defaultConfiguration) {
        self.configuration = configuration
    }
    
    private func realm() throws -> Realm {
        try Realm(configuration: configuration)
    }
    
    func upsert(_ medication: Medication) async throws {
        let realm = try realm()
        try realm.write {
            realm.add(
                MedicationObject(domain: medication),
                update: .modified
            )
        }
    }
    
    func delete(id: String) async throws {
        let realm = try realm()
        guard let obj = realm.object(ofType: MedicationObject.self, forPrimaryKey: id) else { return }
        try realm.write { realm.delete(obj) }
    }
    
    func fetch(id: String) async throws -> Medication? {
        let realm = try realm()
        return await realm.object(ofType: MedicationObject.self, forPrimaryKey: id)?.toDomain()
    }
    
    func fetchAll() async throws -> [Medication] {
        let realm = try realm()
        return realm.objects(MedicationObject.self)
            .sorted(byKeyPath: "startDate", ascending: false)
            .map { $0.toDomain() }
    }
    
    func fetchByPetName(_ petName: String) async throws -> [Medication] {
        let realm = try realm()
        return realm.objects(MedicationObject.self)
            .where { $0.petName == petName }
            .sorted(byKeyPath: "startDate", ascending: false)
            .map { $0.toDomain() }
    }
}

actor MedicationsStoreMock: MedicationsStoreProtocol {
    private let configuration: Realm.Configuration
    
    init(configuration: Realm.Configuration = .defaultConfiguration) {
        self.configuration = configuration
    }
    
    private func realm() throws -> Realm {
        try Realm(configuration: configuration)
    }
    
    func upsert(_ medication: Medication) async throws {
        
    }
    
    func delete(id: String) async throws {
        
    }
    
    func fetch(id: String) async throws -> Medication? {
        return .mock()
    }
    
    func fetchAll() async throws -> [Medication] {
        return [.mock()]
    }
    
    func fetchByPetName(_ petName: String) async throws -> [Medication] {
        return [.mock()]
    }
}

public extension Medication {
    
    static func mock(
        petName: String = "Rocky",
        name: String = "Amoxicillin",
        dosage: String = "500 mg",
        frequency: MedicationFrequency = .every8Hours,
        notes: String = "Give after meals",
        startDate: Date = Date(),
        duration: String = "7 days"
    ) -> Medication {
        Medication(
            petName: petName,
            name: name,
            dosage: dosage,
            frequency: frequency,
            notes: notes,
            startDate: startDate,
            duration: duration
        )
    }
}

