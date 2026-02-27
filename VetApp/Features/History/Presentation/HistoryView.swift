//
//  HistoryView.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

//
//  HistoryView.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import SwiftUI

struct HistoryView: View {
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        content
            .navigationTitle("History")
            .task {
                await viewModel.loadData()
            }
    }
}

private extension HistoryView {
    
    @ViewBuilder
    var content: some View {
        switch viewModel.state {
        case .loading:
            VStack {
                Spacer()
                ProgressView()
                Spacer()
            }
            
        case .loaded(let medications):
            buildMedicationsList(medications: medications)
        }
    }
    
    func buildMedicationsList(medications: [Medication]) -> some View {
        List {
            if medications.isEmpty {
                Section {
                    Text("No medications yet.")
                        .foregroundStyle(Color.app(.secondary))
                }
            } else {
                Section("Medications") {
                    ForEach(medications) { medication in
                        medicationRow(medication: medication)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
    }
    
    func medicationRow(medication: Medication) -> some View {
        Button {
            viewModel.didTapOnMedication(medication: medication)
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(medication.name)
                        .foregroundStyle(.primary)
                    
                    Text(medication.petName)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Text(medication.frequency.rawValue)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#if DEBUG
//#Preview {
//    HistoryView(viewModel: .init(navigator: HistoryNavigatorMock()))
//}
#endif
