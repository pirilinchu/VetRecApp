//
//  MedicationView.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import SwiftUI
import UI

struct MedicationView: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        List {
            
            Section("Pet") {
                detailRow(title: "Pet Name", value: viewModel.medication.petName)
            }
            
            Section("Medication Info") {
                detailRow(title: "Medication", value: viewModel.medication.name)
                detailRow(title: "Dosage", value: viewModel.medication.dosage)
                detailRow(title: "Frequency", value: viewModel.medication.frequency.rawValue)
                detailRow(title: "Start Date", value: formattedDate(viewModel.medication.startDate))
                detailRow(title: "Duration", value: viewModel.medication.duration)
            }
            
            if !viewModel.medication.notes.isEmpty {
                Section("Notes") {
                    Text(viewModel.medication.notes)
                        .font(.app(.body))
                        .foregroundStyle(Color.app(.primaryText))
                }
            }
            
            Section {
                Button {
                    viewModel.exportToPDF()
                } label: {
                    Text("Share Medicaiton")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                Button(role: .destructive) {
                    viewModel.delete()
                } label: {
                    Text("Delete Medication")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .navigationTitle("Medication")
        .listStyle(.insetGrouped)
    }
}

private extension MedicationView {
    
    func detailRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.app(.small))
                .foregroundStyle(Color.app(.secondaryText))
            
            Spacer()
            
            Text(value)
                .font(.app(.body))
                .foregroundStyle(Color.app(.primaryText))
                .multilineTextAlignment(.trailing)
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        date.formatted(date: .abbreviated, time: .omitted)
    }
}
