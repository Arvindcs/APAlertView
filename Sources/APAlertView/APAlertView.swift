//
//  APAlertView.swift
//  APAlertView
//
//  Created by Arvind on 12/04/21.
//

import SwiftUI

// MARK: - Alert Button Configuration
public struct AlertButton {
    public let title: String
    public let style: AlertButtonStyle
    public let action: () -> Void
    
    public init(title: String, style: AlertButtonStyle = .default, action: @escaping () -> Void) {
        self.title = title
        self.style = style
        self.action = action
    }
}

public enum AlertButtonStyle {
    case `default`
    case destructive
    case cancel
}

// MARK: - Alert Configuration
public struct AlertConfiguration {
    public let title: String
    public let message: String
    public let primaryButton: AlertButton
    public let secondaryButton: AlertButton?
    
    public init(
        title: String = "",
        message: String,
        primaryButton: AlertButton,
        secondaryButton: AlertButton? = nil
    ) {
        self.title = title
        self.message = message
        self.primaryButton = primaryButton
        self.secondaryButton = secondaryButton
    }
}

// MARK: - Confirmation Dialog Configuration
public struct ConfirmationDialogConfiguration {
    public let title: String
    public let message: String
    public let buttons: [AlertButton]
    
    public init(
        title: String = "",
        message: String = "",
        buttons: [AlertButton]
    ) {
        self.title = title
        self.message = message
        self.buttons = buttons
    }
}

// MARK: - Main Alert Manager
@MainActor
public class APAlertView: ObservableObject {
    
    // MARK: - Published Properties
    @Published public private(set) var showAlertView: Bool = false
    @Published public private(set) var showActionSheet: Bool = false
    
    // MARK: - Initializer
    public init() {}
    
    // MARK: - Private Properties
    private var currentAlertConfiguration: AlertConfiguration?
    private var currentConfirmationDialogConfiguration: ConfirmationDialogConfiguration?
    
    // MARK: - Public Methods
    
    /// Shows an alert with the specified configuration
    /// - Parameter configuration: The alert configuration
    public func showAlert(_ configuration: AlertConfiguration) {
        currentAlertConfiguration = configuration
        showAlertView = true
    }
    

    
    /// Shows a confirmation dialog with the specified configuration
    /// - Parameter configuration: The confirmation dialog configuration
    public func showConfirmationDialog(_ configuration: ConfirmationDialogConfiguration) {
        currentConfirmationDialogConfiguration = configuration
        showActionSheet = true
    }
    

    
    // MARK: - Internal Methods for ViewModifiers
    
    /// Gets the system alert for the current configuration
    internal var systemAlert: Alert? {
        guard let configuration = currentAlertConfiguration else { return nil }
        
        let primaryButton: Alert.Button
        switch configuration.primaryButton.style {
        case .default:
            primaryButton = .default(Text(configuration.primaryButton.title), action: configuration.primaryButton.action)
        case .destructive:
            primaryButton = .destructive(Text(configuration.primaryButton.title), action: configuration.primaryButton.action)
        case .cancel:
            primaryButton = .cancel(Text(configuration.primaryButton.title), action: configuration.primaryButton.action)
        }
        
        if let secondaryButtonConfig = configuration.secondaryButton {
            let secondaryButton: Alert.Button
            switch secondaryButtonConfig.style {
            case .default:
                secondaryButton = .default(Text(secondaryButtonConfig.title), action: secondaryButtonConfig.action)
            case .destructive:
                secondaryButton = .destructive(Text(secondaryButtonConfig.title), action: secondaryButtonConfig.action)
            case .cancel:
                secondaryButton = .cancel(Text(secondaryButtonConfig.title), action: secondaryButtonConfig.action)
            }
            return Alert(
                title: Text(configuration.title),
                message: Text(configuration.message),
                primaryButton: primaryButton,
                secondaryButton: secondaryButton
            )
        }
        
        return Alert(
            title: Text(configuration.title),
            message: Text(configuration.message),
            dismissButton: primaryButton
        )
    }
    
    /// Gets the current confirmation dialog configuration
    internal var currentConfirmationDialogConfig: ConfirmationDialogConfiguration? {
        return currentConfirmationDialogConfiguration
    }
    
    // MARK: - Dismissal Methods
    
    /// Dismisses the current alert
    public func dismissAlert() {
        showAlertView = false
        currentAlertConfiguration = nil
    }
    
    /// Dismisses the current confirmation dialog
    public func dismissConfirmationDialog() {
        showActionSheet = false
        currentConfirmationDialogConfiguration = nil
    }
}
