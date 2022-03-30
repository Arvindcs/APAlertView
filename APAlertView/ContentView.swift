//
//  ContentView.swift
//  APAlertView
//
//  Created by Arvind on 12/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var alertView = APAlertView()
    @StateObject var actionSheet = APActionSheet()
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Button("Show Default Alert") {
                alertView.showAlertViewWith(title: "Alert", message: "This is APAlertView", buttonTitle: "Ok") {
                    debugPrint("OK Button Pressed")
                }
            }
            .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(6)
            
            Button("Show Alert with Two Button") {
                alertView.showAlertWithTwoButton(title: "Alert", message: "This is APAlertView", firstButtonTitle: "Submit", secondButtonTitle: "Cancel") {
                    debugPrint("Submit Button Pressed")
                } secondCompletionHandler: {
                    debugPrint("Cancel Button Pressed")
                }
            }
            .padding(.init(top: 10, leading: 10, bottom:10, trailing: 10))
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(6)
            
            Button("Show ActionSheet") {
                actionSheet.showActionSheet(title: "This is an ActionSheet", firstButtonTitle: "Add User", secondButtonTitle: "Edit User") {
                    debugPrint("Add User Button Pressed")
                } secondCompletionHandler: {
                    debugPrint("Edit User Button Pressed")
                }
            }
            .padding(.init(top: 10, leading: 10, bottom:10, trailing: 10))
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(6)
                        
        }
        .usesAlert(alertView)
        .usesActionSheet(actionSheet)
    }
}
