//
//  ContentView.swift
//  APAlertView
//
//  Created by Arvind on 12/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var alertView = APAlertView()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // MARK: - API Examples
                    Group {
                        Text("API Examples")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top)
                        
                        Button("Show Alert") {
                            let configuration = AlertConfiguration(
                                title: "Success",
                                message: "Operation completed successfully!",
                                primaryButton: AlertButton(title: "OK") {
                                    print("OK tapped")
                                },
                                secondaryButton: AlertButton(title: "Cancel", style: .cancel) {
                                    print("Cancel tapped")
                                }
                            )
                            alertView.showAlert(configuration)
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button("Show Destructive Alert") {
                            let configuration = AlertConfiguration(
                                title: "Delete Item",
                                message: "Are you sure you want to delete this item? This action cannot be undone.",
                                primaryButton: AlertButton(title: "Delete", style: .destructive) {
                                    print("Delete confirmed")
                                },
                                secondaryButton: AlertButton(title: "Cancel", style: .cancel) {
                                    print("Delete cancelled")
                                }
                            )
                            alertView.showAlert(configuration)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                        
                        Button("Show Action Sheet") {
                            let configuration = ConfirmationDialogConfiguration(
                                title: "Choose Action",
                                message: "Select an action to perform",
                                buttons: [
                                    AlertButton(title: "Add Item") {
                                        print("Add item selected")
                                    },
                                    AlertButton(title: "Edit Item") {
                                        print("Edit item selected")
                                    },
                                    AlertButton(title: "Delete Item", style: .destructive) {
                                        print("Delete item selected")
                                    },
                                    AlertButton(title: "Cancel", style: .cancel) {
                                        print("Action sheet cancelled")
                                    }
                                ]
                            )
                            alertView.showConfirmationDialog(configuration)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                    }
                    

                }
                .padding()
            }
            .navigationTitle("APAlertView Demo")
            .navigationBarTitleDisplayMode(.large)
        }
        .initializeAlertSystem(alertView) // Using the new combined modifier
    }
}

#Preview {
    ContentView()
}
