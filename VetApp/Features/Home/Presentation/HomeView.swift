//
//  HomeView.swift
//  VetApp
//
//  Created by Santiago Mendoza on 26/2/26.
//

import SwiftUI
import UI

struct HomeView: View {
    @StateObject var viewModel: ViewModel
    @FocusState var focusedField: FocusedField?
    
    var body: some View {
        content
            .navigationTitle("Home")
    }
}

private extension HomeView {
    @ViewBuilder
    var content: some View {
        ScrollView {
            VStack(spacing: 12) {
                
                // Pet
                TextField("Pet Name", text: $viewModel.petName)
                    .vetTextField(style: .regular(isActive: focusedField == .petName))
                    .focused($focusedField, equals: .petName)
                
                // Medication name
                TextField("Medication Name", text: $viewModel.medicationName)
                    .vetTextField(style: .regular(isActive: focusedField == .medicationName))
                    .focused($focusedField, equals: .medicationName)
                
                // Dosage
                TextField("Dosage", text: $viewModel.dosage)
                    .vetTextField(style: .regular(isActive: focusedField == .dosage))
                    .focused($focusedField, equals: .dosage)
                
                // Frequency
                VStack(alignment: .leading, spacing: 6) {
                    Text("Frequency")
                        .font(AppFont.body.font)
                        .foregroundStyle(AppColor.secondaryText.color)
                    
                    Picker("Frequency", selection: $viewModel.frequency) {
                        ForEach(Medication.MedicationFrequency.allCases, id: \.self) { frequency in
                            Text(frequency.rawValue).tag(frequency)
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(12)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                // Notes
                TextField("Notes & instructions", text: $viewModel.notes, axis: .vertical)
                    .lineLimit(3...8)
                    .vetTextField(style: .regular(isActive: focusedField == .notes))
                    .focused($focusedField, equals: .notes)
                
                // Start date
                DatePicker("Start date", selection: $viewModel.startDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                
                // Duration
                TextField("Duration (e.g. 7 days)", text: $viewModel.duration)
                    .vetTextField(style: .regular(isActive: focusedField == .duration))
                    .focused($focusedField, equals: .duration)
                
                // Example action button (optional)
                Button("Create") {
                        viewModel.createMedication()
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 8)
            }
            .padding(16)
        }
    }
}

#if DEBUG
#Preview {
    HomeView(viewModel: .init(navigator: HomeNavigatorMock(), saveMedicationUseCase: SaveMedicationUseCaseMock()))
}
#endif
