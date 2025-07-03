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
    
    /// Initializes action sheet functionality for the view
    /// - Parameter alertManager: The alert manager instance
    /// - Returns: A view with action sheet functionality
    public func initializeAlertActionSheet(_ alertManager: APAlertView) -> some View {
        self.modifier(ActionSheetModifier(alert: alertManager))
    }
    
    /// Initializes both alert and action sheet functionality for the view
    /// - Parameter alertManager: The alert manager instance
    /// - Returns: A view with both alert and action sheet functionality
    public func initializeAlertSystem(_ alertManager: APAlertView) -> some View {
        self
            .modifier(AlertViewModifier(alert: alertManager))
            .modifier(ActionSheetModifier(alert: alertManager))
    }
}
