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

// MARK: - Action Sheet Configuration
public struct ActionSheetConfiguration {
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
    
    // MARK: - Private Properties
    private var currentAlertConfiguration: AlertConfiguration?
    private var currentActionSheetConfiguration: ActionSheetConfiguration?
    
    // MARK: - Public Methods
    
    /// Shows an alert with the specified configuration
    /// - Parameter configuration: The alert configuration
    public func showAlert(_ configuration: AlertConfiguration) {
        currentAlertConfiguration = configuration
        showAlertView = true
    }
    

    
    /// Shows an action sheet with the specified configuration
    /// - Parameter configuration: The action sheet configuration
    public func showActionSheet(_ configuration: ActionSheetConfiguration) {
        currentActionSheetConfiguration = configuration
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
    
    /// Gets the system action sheet for the current configuration
    internal var systemActionSheet: ActionSheet? {
        guard let configuration = currentActionSheetConfiguration else { return nil }
        
        let buttons = configuration.buttons.map { button in
            switch button.style {
            case .default:
                return ActionSheet.Button.default(Text(button.title)) {
                    button.action()
                }
            case .destructive:
                return ActionSheet.Button.destructive(Text(button.title)) {
                    button.action()
                }
            case .cancel:
                return ActionSheet.Button.cancel(Text(button.title)) {
                    button.action()
                }
            }
        }
        
        return ActionSheet(
            title: Text(configuration.title),
            message: Text(configuration.message),
            buttons: buttons
        )
    }
    
    // MARK: - Dismissal Methods
    
    /// Dismisses the current alert
    public func dismissAlert() {
        showAlertView = false
        currentAlertConfiguration = nil
    }
    
    /// Dismisses the current action sheet
    public func dismissActionSheet() {
        showActionSheet = false
        currentActionSheetConfiguration = nil
    }
}
