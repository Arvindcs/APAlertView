//
//  ViewModifier.swift
//  APAlertView
//
//  Created by Arvind on 12/04/21.
//

import SwiftUI

// MARK: - Alert View Modifier
struct AlertViewModifier: ViewModifier {
    
    @ObservedObject var alert: APAlertView
    
    public func body(content: Content) -> some View {
        content.alert(isPresented: Binding(
            get: { alert.showAlertView },
            set: { if !$0 { alert.dismissAlert() } }
        )) {
            if let systemAlert = alert.systemAlert {
                systemAlert
            } else {
                // Fallback alert in case of configuration issues
                Alert(
                    title: Text("Error"),
                    message: Text("Unable to display alert"),
                    dismissButton: .default(Text("OK")) {
                        alert.dismissAlert()
                    }
                )
            }
        }
    }
}

// MARK: - Confirmation Dialog Modifier
struct ConfirmationDialogModifier: ViewModifier {
    
    @ObservedObject var alert: APAlertView
    
    public func body(content: Content) -> some View {
        Group {
            if #available(iOS 15, macOS 12, *) {
                content.confirmationDialog(
                    alert.currentConfirmationDialogConfig?.title ?? "",
                    isPresented: Binding(
                        get: { alert.showActionSheet },
                        set: { if !$0 { alert.dismissConfirmationDialog() } }
                    ),
                    titleVisibility: .visible,
                    presenting: alert.currentConfirmationDialogConfig
                ) { configuration in
                    ForEach(Array(configuration.buttons.enumerated()), id: \ .offset) { _, button in
                        switch button.style {
                        case .default:
                            Button(button.title) {
                                button.action()
                            }
                        case .destructive:
                            Button(button.title, role: .destructive) {
                                button.action()
                            }
                        case .cancel:
                            Button(button.title, role: .cancel) {
                                button.action()
                            }
                        }
                    }
                } message: { configuration in
                    if !configuration.message.isEmpty {
                        Text(configuration.message)
                    }
                }
            } else {
                content // Fallback: do nothing on older OS
            }
        }
    }
}
