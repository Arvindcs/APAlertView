//
//  AdvancedExample.swift
//  APAlertView
//
//  Created by Arvind on 12/04/21.
//

import SwiftUI

struct AdvancedExample: View {
    @StateObject var alertView = APAlertView()
    @State private var selectedOption: String = "None"
    @State private var isProcessing = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // MARK: - Async Examples
                    Group {
                        Text("Async/Await Examples")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top)
                        
                        Button("Async Confirmation") {
                            Task {
                                isProcessing = true
                                let confirmed = await alertView.showConfirmationAsync(
                                    title: "Save Changes",
                                    message: "Do you want to save your changes?"
                                )
                                isProcessing = false
                                
                                if confirmed {
                                    selectedOption = "User confirmed save"
                                } else {
                                    selectedOption = "User cancelled save"
                                }
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(isProcessing)
                        
                        Button("Async Choice Selection") {
                            Task {
                                isProcessing = true
                                let configuration = AlertConfiguration(
                                    title: "Choose Theme",
                                    message: "Select your preferred theme",
                                    primaryButton: AlertButton(title: "Light") {},
                                    secondaryButton: AlertButton(title: "Dark") {}
                                )
                                
                                let choice = await alertView.showAlertAsync(configuration)
                                isProcessing = false
                                selectedOption = choice ?? "No choice made"
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(isProcessing)
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    // MARK: - Convenience Methods
                    Group {
                        Text("Convenience Methods")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Button("Success Alert") {
                            alertView.showSuccessAlert(
                                title: "Great!",
                                message: "Your profile has been updated successfully!"
                            )
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        
                        Button("Error Alert") {
                            alertView.showErrorAlert(
                                title: "Oops!",
                                message: "Something went wrong. Please try again."
                            )
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                        
                        Button("Confirmation Alert") {
                            alertView.showConfirmationAlert(
                                title: "Delete Item",
                                message: "Are you sure you want to delete this item?",
                                onConfirm: {
                                    selectedOption = "Item deleted"
                                },
                                onCancel: {
                                    selectedOption = "Deletion cancelled"
                                }
                            )
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)
                        
                        Button("Destructive Alert") {
                            alertView.showDestructiveAlert(
                                title: "Delete Account",
                                message: "This action cannot be undone. All your data will be permanently deleted.",
                                onDestructive: {
                                    selectedOption = "Account deleted"
                                }
                            )
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    // MARK: - Advanced Action Sheets
                    Group {
                        Text("Advanced Action Sheets")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Button("Photo Picker") {
                            alertView.showPhotoPickerActionSheet(
                                onCamera: {
                                    selectedOption = "Camera selected"
                                },
                                onPhotoLibrary: {
                                    selectedOption = "Photo library selected"
                                }
                            )
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        
                        Button("Custom Action Sheet") {
                            alertView.showActionSheet(
                                title: "File Actions",
                                message: "Choose what to do with the file",
                                actions: [
                                    ("Open", { selectedOption = "File opened" }),
                                    ("Share", { selectedOption = "File shared" }),
                                    ("Rename", { selectedOption = "File renamed" }),
                                    ("Move", { selectedOption = "File moved" })
                                ]
                            )
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.purple)
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    // MARK: - Status Display
                    Group {
                        Text("Status")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Selected Option: \(selectedOption)")
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                        
                        if isProcessing {
                            HStack {
                                ProgressView()
                                    .scaleEffect(0.8)
                                Text("Processing...")
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Advanced Examples")
            .navigationBarTitleDisplayMode(.large)
        }
        .initializeAlertSystem(alertView)
    }
}

#Preview {
    AdvancedExample()
} 