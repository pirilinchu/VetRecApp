//
//  Router+Medication.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

@MainActor
protocol MedicationNavigating: AnyObject {
    func popToRoot()
}

extension Router: MedicationNavigating {
    func popToRoot() {
        reset(selectedTab)
    }
}
