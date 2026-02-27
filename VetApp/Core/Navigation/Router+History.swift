//
//  NavigationProtocols.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import Foundation

@MainActor
protocol HistoryNavigating: AnyObject {
    func goToDetail(medication: Medication)
}

extension Router: HistoryNavigating {
    func goToDetail(medication: Medication) { push(.detail(medication)) }
}
