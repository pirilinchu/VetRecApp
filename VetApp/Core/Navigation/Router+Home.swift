//
//  HomeRouter.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

@MainActor
protocol HomeNavigating: AnyObject {
    func goToMedication(medication: Medication)
}

extension Router: HomeNavigating {
    func goToMedication(medication: Medication) {
        push(.detail(medication))
    }
}
