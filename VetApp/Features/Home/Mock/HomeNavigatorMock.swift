//
//  HomeNavigatorMock.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//
#if DEBUG
import Foundation

@MainActor
final class HomeNavigatorMock: HomeNavigating {
    func goToMedication(medication: Medication) {
        // TODO: Santi add mock navigation?
    }
}
#endif
