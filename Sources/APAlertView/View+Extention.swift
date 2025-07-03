//
//  View+Extension.swift
//  APAlertView
//
//  Created by Arvind on 12/04/21.
//

import SwiftUI

extension View {
    
    /// Initializes alert functionality for the view
    /// - Parameter alertManager: The alert manager instance
    /// - Returns: A view with alert functionality
    public func initializeAlert(_ alertManager: APAlertView) -> some View {
        self.modifier(AlertViewModifier(alert: alertManager))
    }
    
    /// Initializes confirmation dialog functionality for the view
    /// - Parameter alertManager: The alert manager instance
    /// - Returns: A view with confirmation dialog functionality
    public func initializeAlertConfirmationDialog(_ alertManager: APAlertView) -> some View {
        self.modifier(ConfirmationDialogModifier(alert: alertManager))
    }
    
    /// Initializes both alert and confirmation dialog functionality for the view
    /// - Parameter alertManager: The alert manager instance
    /// - Returns: A view with both alert and confirmation dialog functionality
    public func initializeAlertSystem(_ alertManager: APAlertView) -> some View {
        self
            .modifier(AlertViewModifier(alert: alertManager))
            .modifier(ConfirmationDialogModifier(alert: alertManager))
    }
}
