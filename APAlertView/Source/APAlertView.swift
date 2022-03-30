//
//  ContentView.swift
//  APAlertView
//
//  Created by Arvind on 12/04/21.
//

import SwiftUI

public class APAlertView: ObservableObject {
    
    public enum AlertType {
        case defaults
        case custom
    }
    
    // MARK: Published
    @Published public var showAlert : Bool = false
    
    // MARK: Properties
    private var alertType : AlertType = AlertType.defaults
    private var alertTitle : String = "Alert"
    private var alertMessage : String = "APAlertView is awesome"
    
    private var defaultButtonTitle: String = "Dismiss"
    private var defaultButtonCompletionHandler: () -> () = {}
    
    private var secondButtonTitle: String = "Ok"
    private var secondCompletionHandler: () -> () = {}
    
    //MARK:- Default Alert View
    public func showAlertWith(title: String,
                              message: String,
                              buttonTitle: String,
                              defaultCompletionHandler: @escaping () -> ()) {
        self.alertType = .defaults
        self.alertTitle = title
        self.alertMessage = message
        self.defaultButtonTitle = buttonTitle
        self.defaultButtonCompletionHandler = defaultCompletionHandler
        showAlert = true
    }
    
    // MARK: A representation for an alert presentation.
    private var getDefaultAlert: Alert {
        
        let defaultButton = Alert.Button.default(Text(defaultButtonTitle)) {
            self.defaultButtonCompletionHandler()
        }
        
        return Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: defaultButton)
    }
    
    //MARK:- Custom Alert View
    public func showCustomAlertWith(title: String,
                                    message: String,
                                    defaultButtonTitle: String,
                                    secondButtonTitle: String,
                                    defaultCompletionHandler: @escaping () -> (),
                                    secondCompletionHandler: @escaping () -> ()) {
        self.alertType = .custom
        self.alertTitle = title
        self.alertMessage = message
        
        self.secondButtonTitle = secondButtonTitle
        self.secondCompletionHandler = secondCompletionHandler
        
        self.defaultButtonTitle = defaultButtonTitle
        self.defaultButtonCompletionHandler = defaultCompletionHandler
        
        showAlert = true
    }
    
    private var getStandardChoiceAlert: Alert {
        let primaryButton = Alert.Button.default(Text(defaultButtonTitle)) {
            self.defaultButtonCompletionHandler()
        }
        
        let secondaryButton = Alert.Button.default(Text(secondButtonTitle)) {
            self.secondCompletionHandler()
        }
        
        return Alert(title: Text(alertTitle),
                     message: Text(alertMessage),
                     primaryButton: primaryButton,
                     secondaryButton: secondaryButton
        )
    }
    
    //MARK:- Internal Method
    public func getCurrentAlert() -> Alert {
        switch alertType {
        case .defaults:
            return getDefaultAlert
        case .custom:
            return getStandardChoiceAlert
        }
    }
}

public struct AlertViewModifier: ViewModifier {
    
    @ObservedObject var alert: APAlertView
    
    public func body(content: Content) -> some View {
        content
            .alert(isPresented: $alert.showAlert) {
                alert.getCurrentAlert()
            }
    }
}

extension View {
    
    public func uses(_ alertManager: APAlertView) -> some View {
        self.modifier(AlertViewModifier(alert: alertManager))
    }
}
