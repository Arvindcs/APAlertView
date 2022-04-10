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
        
        VStack(spacing: 30) {
            
            Button("Show Default Alert") {
                alertView.showAlertView(title: "Alert", message: "Some Message", primaryCompletion: ("OK", {
                    debugPrint("OK")
                }))
            }
            
            
            Button("Show Alert with Two Button") {
                alertView.showAlertView(title: "Alert", message: "Some Message", primaryCompletion: ("OK", {
                    debugPrint("OK")
                }), secondaryCompletion: ("Cancel", {
                    debugPrint("Cancel")
                }))
            }
            
            
            Button("Show ActionSheet") {
                
                alertView.showActionSheet(title: "ActionSheet", message: "Message" , primaryCompletion: ("Add", {
                    debugPrint("Add")
                }), secondaryCompletion: ("Delete", {
                    debugPrint("Delete")
                }), dissmissCompletion: ("Cancel", {
                    debugPrint("Cancel")
                }))
                
            }
            
        }
        .initializeAlert(alertView)
        .initializeAlertActionSheet(alertView)
    }
}
