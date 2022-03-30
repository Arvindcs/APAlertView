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
        case twoButton
    }
    
    // MARK: Published
    @Published public var showAlertView : Bool = false
    
    // MARK: Properties
    private var alertType : AlertType = AlertType.defaults
    private var title : String = ""
    private var message : String = ""
    
    private var defaultButtonTitle: String = "OK"
    private var defaultButtonCompletionHandler: () -> () = {}
    
    private var secondButtonTitle: String = ""
    private var secondCompletionHandler: () -> () = {}
    
    //MARK:- Default Alert View
    public func showAlertViewWith(title: String = "",
                                  message: String = "",
                                  buttonTitle: String,
                                  defaultCompletionHandler: @escaping () -> ()) {
        self.alertType = .defaults
        self.title = title
        self.message = message
        self.defaultButtonTitle = buttonTitle
        self.defaultButtonCompletionHandler = defaultCompletionHandler
        showAlertView = true
    }
    
    // MARK: A representation for an alert presentation.
    private var getDefaultAlert: Alert {
        
        let defaultButton = Alert.Button.default(Text(defaultButtonTitle)) {
            self.defaultButtonCompletionHandler()
        }
        
        return Alert(title: Text(title), message: Text(message), dismissButton: defaultButton)
    }
    //MARK:- Alert View with Two Button
    public func showAlertWithTwoButton(title: String = "",
                                       message: String = "",
                                       firstButtonTitle: String,
                                       secondButtonTitle: String,
                                       firstCompletionHandler: @escaping () -> (),
                                       secondCompletionHandler: @escaping () -> ()) {
        self.alertType = .twoButton
        self.title = title
        self.message = message
        
        self.defaultButtonTitle = firstButtonTitle
        self.defaultButtonCompletionHandler = firstCompletionHandler
        
        self.secondButtonTitle = secondButtonTitle
        self.secondCompletionHandler = secondCompletionHandler
        
        showAlertView = true
    }
    
    private var getTwoButtonAlert: Alert {
        let primaryButton = Alert.Button.default(Text(defaultButtonTitle)) {
            self.defaultButtonCompletionHandler()
        }
        
        let secondaryButton = Alert.Button.default(Text(secondButtonTitle)) {
            self.secondCompletionHandler()
        }
        
        return Alert(title: Text(title),
                     message: Text(message),
                     primaryButton: primaryButton,
                     secondaryButton: secondaryButton
        )
    }
    
    //MARK:- Internal Method
    public func getCurrentAlert() -> Alert {
        switch alertType {
        case .defaults:
            return getDefaultAlert
        case .twoButton:
            return getTwoButtonAlert
        }
    }
}

public struct AlertViewModifier: ViewModifier {
    
    @ObservedObject var alert: APAlertView
    
    public func body(content: Content) -> some View {
        content
            .alert(isPresented: $alert.showAlertView) {
                alert.getCurrentAlert()
            }
    }
}

extension View {
    
    public func usesAlert(_ alertManager: APAlertView) -> some View {
        self.modifier(AlertViewModifier(alert: alertManager))
    }
}
