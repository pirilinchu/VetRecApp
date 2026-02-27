//
//  Medication.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import Foundation

public struct Medication: Identifiable, Codable, Equatable, Hashable {
    
    // Pet name acts as unique identifier
    public let id: UUID
    public let petName: String
    public let name: String
    public let dosage: String
    public let frequency: MedicationFrequency
    public let frequencyExtra: String?
    public let notes: String
    public let startDate: Date
    public let duration: String
    
    public init(
        id: UUID = UUID(),
        petName: String,
        name: String,
        dosage: String,
        frequency: MedicationFrequency,
        frequencyExtra: String? = nil,
        notes: String,
        startDate: Date,
        duration: String
    ) {
        self.id = id
        self.petName = petName
        self.name = name
        self.dosage = dosage
        self.frequency = frequency
        self.frequencyExtra = frequencyExtra
        self.notes = notes
        self.startDate = startDate
        self.duration = duration
    }
    
    public enum MedicationFrequency: String, Codable, CaseIterable {
        case onceDaily = "once_daily"
        case twiceDaily = "twice_daily"
        case every8Hours = "every_8_hours"
        case every12Hours = "every_12_hours"
        case asNeeded = "as_needed"
        case custom
    }
}
