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
                alertView.showAlertWith(title: "Alert", message: "This is APAlertView", buttonTitle: "Ok") {
                    debugPrint("Submit Button Pressed")
                }
            }
            .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(6)
            
            Button("Show Alert with Two Button") {
                alertView.showCustomAlertWith(title: "Alert", message: "This is APAlertView", defaultButtonTitle: "Submit", secondButtonTitle: "Cancel") {
                    debugPrint("Submit Button Pressed")
                } secondCompletionHandler: {
                    debugPrint("Cancel Button Pressed")
                }
            }
            .padding(.init(top: 10, leading: 10, bottom:10, trailing: 10))
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(6)
            
        }.uses(alertView)
    }
}
