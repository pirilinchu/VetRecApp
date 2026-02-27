//
//  HTextFieldStyle.swift
//  UI
//
//  Created by Santiago Mendoza on 26/2/26.
//


import SwiftUI

public struct VTextFieldStyle: TextFieldStyle {
    private var title: String?
    private var message: String?
    private var style: Style


    public init(title: String? = nil, message: String? = nil, style: Style) {
        self.title = title
        self.message = message
        self.style = style
    }

    private func strokeColor(isActive: Bool, withBorder: Bool = true) -> Color {
        isActive
        ? .app(.primary)
        : .app(.secondary)
    }

    public func _body(configuration: TextField<Self._Label>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            if let title {
                Text(title)
                    .font(.app(.body))
                    .foregroundStyle(Color.app(.primaryText))
            }
            switch style {
            case .regular(let isActive):
                HStack(spacing: 8) {
                    configuration
                        .lineLimit(2)
                        .font(.app(.body))
                        .foregroundStyle(Color.app(.primaryText))
                }
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(message == nil ? strokeColor(isActive: isActive) : .app(.error), lineWidth: 1)
                }
            }

            if let message {
                HStack(spacing: 4) {
                    Text(message)
                        .foregroundStyle(Color.app(.error))
                        .font(.caption)
                        .padding(.leading, 4)
                        .contentTransition(.numericText())
                }
            }
        }
    }
}

public extension View {
    func vetTextField(title: String? = nil, message: String? = nil, style: VTextFieldStyle.Style) -> some View {
        self.textFieldStyle(VTextFieldStyle(title: title, message: message, style: style))
    }
}

public extension VTextFieldStyle {
    enum Style {
        case regular(isActive: Bool)
    }
}

#Preview {
    @Previewable @State var text = ""
    @Previewable @State var error: String? = nil
    VStack {
        TextField("Preview", text: $text)
            .vetTextField(title: "Inactive", message: error, style: .regular(isActive: false))

        TextField("Preview", text: $text)
            .vetTextField(title: "Active", message: error, style: .regular(isActive: true))
    }
    .padding()
    .onChange(of: text) { oldValue, newValue in
        withAnimation {
            if newValue.count > 5 {
                error = "Longer please"
            } else {
                error = nil
            }
        }
    }
}
