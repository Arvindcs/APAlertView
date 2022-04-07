//
//  AlertViewModifier.swift
//  APAlertView
//
//  Created by Arvind on 12/04/21.
//

import SwiftUI

struct AlertViewModifier: ViewModifier {
    
    @ObservedObject var alert: APAlertView
    
    public func body(content: Content) -> some View {
        content.alert(isPresented: $alert.showAlertView) {
            alert.getSystemAlert
        }
    }
}

struct ActionSheetModifier: ViewModifier {
    
    @ObservedObject var alert: APAlertView
    
    public func body(content: Content) -> some View {
        content.actionSheet(isPresented: $alert.showActionSheet, content: {
            alert.getActionSheet
        })
    }
}
