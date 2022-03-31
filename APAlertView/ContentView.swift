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
                alertView.showAlertViewWith(title: "Alert", message: "This is APAlertView", buttonTitle: "Ok") {
                    debugPrint("OK Button Pressed")
                }
            }
            
            Button("Show Alert with Two Button") {
                alertView.showAlertWithTwoButton(title: "Alert", message: "This is APAlertView", firstButtonTitle: "Submit", secondButtonTitle: "Cancel") {
                    debugPrint("Submit Button Pressed")
                } secondCompletionHandler: {
                    debugPrint("Cancel Button Pressed")
                }
            }
           
            
            Button("Show ActionSheet") {
              alertView.showActionSheet(title: "This is an ActionSheet", firstButtonTitle: "Add User", secondButtonTitle: "Edit User") {
                    debugPrint("Add User Button Pressed")
                } secondCompletionHandler: {
                    debugPrint("Edit User Button Pressed")
                }
            }
           
        }
        .initializeAlert(alertView)
        .initializeAlertActionSheet(alertView.actionSheet)
    }
}
