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

// MARK: - Action Sheet Modifier
struct ActionSheetModifier: ViewModifier {
    
    @ObservedObject var alert: APAlertView
    
    public func body(content: Content) -> some View {
        content.actionSheet(isPresented: Binding(
            get: { alert.showActionSheet },
            set: { if !$0 { alert.dismissActionSheet() } }
        )) {
            if let systemActionSheet = alert.systemActionSheet {
                systemActionSheet
            } else {
                // Fallback action sheet in case of configuration issues
                ActionSheet(
                    title: Text("Error"),
                    message: Text("Unable to display action sheet"),
                    buttons: [.default(Text("OK")) {
                        alert.dismissActionSheet()
                    }]
                )
            }
        }
    }
}
