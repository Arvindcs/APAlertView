//
//  View+Extention.swift
//  APAlertView
//
//  Created by Arvind on 12/04/21.
//

import SwiftUI

extension View {
    public func initializeAlert(_ alertManager: APAlertView) -> some View {
        self.modifier(AlertViewModifier(alert: alertManager))
    }
    
    public func initializeAlertActionSheet(_ alertManager: APAlertView) -> some View {
        self.modifier(ActionSheetModifier(alert: alertManager))
    }
}
