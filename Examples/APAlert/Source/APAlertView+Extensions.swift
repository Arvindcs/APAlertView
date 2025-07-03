//
//  APAlertView+Extensions.swift
//  APAlertView
//
//  Created by Arvind on 12/04/21.
//

import SwiftUI

// MARK: - Convenience Extensions
extension APAlertView {
    
    // MARK: - Quick Alert Methods
    
    /// Shows a simple success alert
    /// - Parameters:
    ///   - title: Alert title (defaults to "Success")
    ///   - message: Alert message
    ///   - completion: Optional completion handler
    public func showSuccessAlert(
        title: String = "Success",
        message: String,
        completion: (() -> Void)? = nil
    ) {
        let configuration = AlertConfiguration(
            title: title,
            message: message,
            primaryButton: AlertButton(title: "OK") {
                completion?()
            }
        )
        showAlert(configuration)
    }
    
    /// Shows a simple error alert
    /// - Parameters:
    ///   - title: Alert title (defaults to "Error")
    ///   - message: Alert message
    ///   - completion: Optional completion handler
    public func showErrorAlert(
        title: String = "Error",
        message: String,
        completion: (() -> Void)? = nil
    ) {
        let configuration = AlertConfiguration(
            title: title,
            message: message,
            primaryButton: AlertButton(title: "OK") {
                completion?()
            }
        )
        showAlert(configuration)
    }
    
    /// Shows a confirmation alert
    /// - Parameters:
    ///   - title: Alert title
    ///   - message: Alert message
    ///   - confirmTitle: Confirm button title (defaults to "Confirm")
    ///   - cancelTitle: Cancel button title (defaults to "Cancel")
    ///   - onConfirm: Action to perform on confirmation
    ///   - onCancel: Optional action to perform on cancellation
    public func showConfirmationAlert(
        title: String,
        message: String,
        confirmTitle: String = "Confirm",
        cancelTitle: String = "Cancel",
        onConfirm: @escaping () -> Void,
        onCancel: (() -> Void)? = nil
    ) {
        let configuration = AlertConfiguration(
            title: title,
            message: message,
            primaryButton: AlertButton(title: confirmTitle) {
                onConfirm()
            },
            secondaryButton: AlertButton(title: cancelTitle, style: .cancel) {
                onCancel?()
            }
        )
        showAlert(configuration)
    }
    
    /// Shows a destructive confirmation alert
    /// - Parameters:
    ///   - title: Alert title
    ///   - message: Alert message
    ///   - destructiveTitle: Destructive button title (defaults to "Delete")
    ///   - cancelTitle: Cancel button title (defaults to "Cancel")
    ///   - onDestructive: Action to perform on destructive action
    ///   - onCancel: Optional action to perform on cancellation
    public func showDestructiveAlert(
        title: String,
        message: String,
        destructiveTitle: String = "Delete",
        cancelTitle: String = "Cancel",
        onDestructive: @escaping () -> Void,
        onCancel: (() -> Void)? = nil
    ) {
        let configuration = AlertConfiguration(
            title: title,
            message: message,
            primaryButton: AlertButton(title: destructiveTitle, style: .destructive) {
                onDestructive()
            },
            secondaryButton: AlertButton(title: cancelTitle, style: .cancel) {
                onCancel?()
            }
        )
        showAlert(configuration)
    }
    
    // MARK: - Quick Action Sheet Methods
    
    /// Shows a simple action sheet with custom actions
    /// - Parameters:
    ///   - title: Action sheet title
    ///   - message: Action sheet message
    ///   - actions: Array of action tuples (title, action)
    ///   - cancelTitle: Cancel button title (defaults to "Cancel")
    public func showActionSheet(
        title: String,
        message: String = "",
        actions: [(String, () -> Void)],
        cancelTitle: String = "Cancel"
    ) {
        var buttons: [AlertButton] = []
        
        for (actionTitle, action) in actions {
            buttons.append(AlertButton(title: actionTitle) {
                action()
            })
        }
        
        buttons.append(AlertButton(title: cancelTitle, style: .cancel) {})
        
        let configuration = ActionSheetConfiguration(
            title: title,
            message: message,
            buttons: buttons
        )
        showActionSheet(configuration)
    }
    
    /// Shows a photo picker action sheet
    /// - Parameters:
    ///   - onCamera: Action to perform when camera is selected
    ///   - onPhotoLibrary: Action to perform when photo library is selected
    ///   - onCancel: Optional action to perform on cancellation
    public func showPhotoPickerActionSheet(
        onCamera: @escaping () -> Void,
        onPhotoLibrary: @escaping () -> Void,
        onCancel: (() -> Void)? = nil
    ) {
        let configuration = ActionSheetConfiguration(
            title: "Choose Photo",
            message: "Select a photo source",
            buttons: [
                AlertButton(title: "Camera") {
                    onCamera()
                },
                AlertButton(title: "Photo Library") {
                    onPhotoLibrary()
                },
                AlertButton(title: "Cancel", style: .cancel) {
                    onCancel?()
                }
            ]
        )
        showActionSheet(configuration)
    }
}

// MARK: - Async Extensions
extension APAlertView {
    
    /// Shows an alert and returns the user's choice
    /// - Parameter configuration: The alert configuration
    /// - Returns: The title of the button that was tapped, or nil if cancelled
    @MainActor
    public func showAlertAsync(_ configuration: AlertConfiguration) async -> String? {
        return await withCheckedContinuation { continuation in
            // Override primary button action
            let originalPrimaryAction = configuration.primaryButton.action
            let primaryButton = AlertButton(title: configuration.primaryButton.title, style: configuration.primaryButton.style) {
                originalPrimaryAction()
                continuation.resume(returning: configuration.primaryButton.title)
            }
            
            // Override secondary button action if exists
            let secondaryButton: AlertButton?
            if let originalSecondary = configuration.secondaryButton {
                let originalSecondaryAction = originalSecondary.action
                secondaryButton = AlertButton(title: originalSecondary.title, style: originalSecondary.style) {
                    originalSecondaryAction()
                    continuation.resume(returning: originalSecondary.title)
                }
            } else {
                secondaryButton = nil
            }
            
            let asyncConfiguration = AlertConfiguration(
                title: configuration.title,
                message: configuration.message,
                primaryButton: primaryButton,
                secondaryButton: secondaryButton
            )
            
            showAlert(asyncConfiguration)
        }
    }
    
    /// Shows a confirmation alert and returns the user's choice
    /// - Parameters:
    ///   - title: Alert title
    ///   - message: Alert message
    ///   - confirmTitle: Confirm button title
    ///   - cancelTitle: Cancel button title
    /// - Returns: True if confirmed, false if cancelled
    @MainActor
    public func showConfirmationAsync(
        title: String,
        message: String,
        confirmTitle: String = "Confirm",
        cancelTitle: String = "Cancel"
    ) async -> Bool {
        let configuration = AlertConfiguration(
            title: title,
            message: message,
            primaryButton: AlertButton(title: confirmTitle) {},
            secondaryButton: AlertButton(title: cancelTitle, style: .cancel) {}
        )
        
        let result = await showAlertAsync(configuration)
        return result == confirmTitle
    }
} 