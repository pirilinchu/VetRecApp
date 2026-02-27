//
//  MedicationObject.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//


import Foundation
import RealmSwift

final class MedicationObject: Object {
    @Persisted(primaryKey: true) var id: String
    
    @Persisted var petName: String = ""
    @Persisted var name: String = ""
    @Persisted var dosage: String = ""
    @Persisted var frequencyRaw: String = ""
    @Persisted var frequencyExtra: String?
    @Persisted var notes: String = ""
    @Persisted var startDate: Date = .distantPast
    @Persisted var duration: String = ""
}

extension MedicationObject {
    convenience init(domain: Medication) {
        self.init()
        self.id = domain.id.uuidString
        self.petName = domain.petName
        self.name = domain.name
        self.dosage = domain.dosage
        self.frequencyRaw = domain.frequency.rawValue
        self.frequencyExtra = domain.frequencyExtra
        self.notes = domain.notes
        self.startDate = domain.startDate
        self.duration = domain.duration
    }
    
    func toDomain() -> Medication {
        Medication(
            id: UUID(uuidString: id) ?? UUID(),
            petName: petName,
            name: name,
            dosage: dosage,
            frequency: Medication.MedicationFrequency(rawValue: frequencyRaw) ?? .custom,
            frequencyExtra: frequencyExtra,
            notes: notes,
            startDate: startDate,
            duration: duration
        )
    }
}
