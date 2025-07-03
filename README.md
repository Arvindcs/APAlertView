# APAlertView

[![swiftUI](https://img.shields.io/badge/SWIFTUI-green)](https://developer.apple.com/documentation/swiftui)
[![InstaGram](https://img.shields.io/badge/Instagram-arvind_iOSDev-brightgreen)](https://www.instagram.com/arvind_iosdev)

APAlertView is a powerful, modern SwiftUI alert and action sheet library. It provides a clean, type-safe API for displaying alerts and action sheets with extensive customization options while maintaining backward compatibility.

## ✨ Features

- 🎯 **Type-safe API** with modern Swift features
- 🔄 **Backward compatibility** with existing code
- 🎨 **Extensive customization** options
- ⚡ **Async/await support** for modern concurrency
- 🏗️ **SOLID principles** compliant architecture
- 📱 **iOS 13+** support
- 🎭 **Multiple button styles** (default, destructive, cancel)
- 🚀 **Convenience methods** for common use cases

## Screenshots

<img src="https://github.com/Arvindcs/APAlertView/blob/main/images/screenshot.png" width="700" height="475"/>

#### If you like the project, don't forget to `put star 🌟`.

<a href="https://paypal.me/arvindp07" target="_blank"><img src="https://img.shields.io/badge/Donate-informational?style=for-the-badge&logo=paypal&logoColor=white" ></a>

## Setup Instructions

### Swift Package Manager
For adding it as a Swift Package in Xcode 13.0 or later, select File > Add Packages > then add the repository URL:

```
https://github.com/arvindcs/APAlertView.git
```

### Manually
Drag all Swift files from the `APAlert/Source/` directory to your project.

## Requirements
* iOS 13+
* Xcode 11+
* Swift 5.0+

## 🚀 Modern API Examples

### Basic Alert
```swift
import SwiftUI

struct ContentView: View {
    @StateObject var alertView = APAlertView()
    
    var body: some View {
        Button("Show Alert") {
            let configuration = AlertConfiguration(
                title: "Success",
                message: "Operation completed successfully!",
                primaryButton: AlertButton(title: "OK") {
                    print("OK tapped")
                }
            )
            alertView.showAlert(configuration)
        }
        .initializeAlert(alertView)
    }
}
```

### Alert with Two Buttons
```swift
Button("Show Confirmation") {
    let configuration = AlertConfiguration(
        title: "Confirm Action",
        message: "Are you sure you want to proceed?",
        primaryButton: AlertButton(title: "Confirm") {
            print("Confirmed")
        },
        secondaryButton: AlertButton(title: "Cancel", style: .cancel) {
            print("Cancelled")
        }
    )
    alertView.showAlert(configuration)
}
```

### Destructive Alert
```swift
Button("Delete Item") {
    let configuration = AlertConfiguration(
        title: "Delete Item",
        message: "This action cannot be undone.",
        primaryButton: AlertButton(title: "Delete", style: .destructive) {
            print("Item deleted")
        },
        secondaryButton: AlertButton(title: "Cancel", style: .cancel) {
            print("Deletion cancelled")
        }
    )
    alertView.showAlert(configuration)
}
```

### Confirmation Dialog (formerly Action Sheet)
```swift
Button("Show Confirmation Dialog") {
    let configuration = ConfirmationDialogConfiguration(
        title: "Choose Action",
        message: "Select an action to perform",
        buttons: [
            AlertButton(title: "Add Item") {
                print("Add selected")
            },
            AlertButton(title: "Edit Item") {
                print("Edit selected")
            },
            AlertButton(title: "Delete Item", style: .destructive) {
                print("Delete selected")
            },
            AlertButton(title: "Cancel", style: .cancel) {
                print("Cancelled")
            }
        ]
    )
    alertView.showConfirmationDialog(configuration)
}
```

### Photo Picker Confirmation Dialog
```swift
alertView.showPhotoPickerConfirmationDialog(
    onCamera: { print("Camera selected") },
    onPhotoLibrary: { print("Photo library selected") }
)
```

## 🎯 Convenience Methods

### Quick Success/Error Alerts
```swift
// Success alert
alertView.showSuccessAlert(message: "Operation completed successfully!")

// Error alert
alertView.showErrorAlert(message: "Something went wrong")
```

### Confirmation Alerts
```swift
// Simple confirmation
alertView.showConfirmationAlert(
    title: "Save Changes",
    message: "Do you want to save your changes?",
    onConfirm: { print("Saved") },
    onCancel: { print("Cancelled") }
)

// Destructive confirmation
alertView.showDestructiveAlert(
    title: "Delete Account",
    message: "This action cannot be undone.",
    onDestructive: { print("Account deleted") }
)
```

## ⚡ Async/Await Support

### Async Alerts
```swift
Task {
    let result = await alertView.showConfirmationAsync(
        title: "Save Changes",
        message: "Do you want to save your changes?"
    )
    
    if result {
        print("User confirmed")
        // Save changes
    } else {
        print("User cancelled")
    }
}
```

### Custom Async Alert
```swift
Task {
    let configuration = AlertConfiguration(
        title: "Choose Option",
        message: "Select an option",
        primaryButton: AlertButton(title: "Option A") {},
        secondaryButton: AlertButton(title: "Option B") {}
    )
    
    let choice = await alertView.showAlertAsync(configuration)
    print("User selected: \(choice ?? "none")")
}
```

## 🔄 Legacy API (Backward Compatibility)

The original API is still fully supported:

### Legacy Alert
```swift
alertView.showAlertView(
    title: "Alert",
    message: "Some Message",
    primaryCompletion: ("OK", {
        print("OK tapped")
    })
)
```

### Legacy Action Sheet
```swift
alertView.showActionSheet(
    title: "ActionSheet",
    message: "Message",
    primaryCompletion: ("Add", { print("Add") }),
    secondaryCompletion: ("Delete", { print("Delete") }),
    dismissCompletion: ("Cancel", { print("Cancel") })
)
```

## 🎨 View Modifiers

### Individual Modifiers
```swift
.initializeAlert(alertView)           // For alerts only
.initializeAlertConfirmationDialog(alertView) // For confirmation dialogs only
```

### Combined Modifier
```swift
.initializeAlertSystem(alertView)     // For both alerts and confirmation dialogs
```

## 📋 Migration Guide

### From v2.x to v3.x

1. **No breaking changes** - all existing code continues to work
2. **Optional upgrade** - you can gradually adopt the new API
3. **New features** - take advantage of type safety and convenience methods

### Recommended Migration Steps

1. Keep existing code as-is
2. Gradually replace with new API for new features
3. Use convenience methods for common patterns
4. Consider async/await for new async operations

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

MIT License

Copyright (c) 2022 Arvind Patel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

<img src="https://github.com/Arvindcs/APAlertView/blob/main/images/banner.gif">
