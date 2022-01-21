//
//  ContentView.swift
//  APAlertView
//
//  Created by Arvind on 12/04/21.
//

import SwiftUI

struct ContentView: View {
    
    let alertTitle   = "Something Went Wrong"
    let alertMessage = "Request could not be processed due to a server error. The request may succeed if you try again."
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Show Alert")
                .frame(width: 200, height: 40)
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(6)
                .onTapGesture {
                    APAlertView.shared.showAlertView(with: alertTitle, message: alertMessage, buttonTitle: "OK")
                }
            
        }
    }
}
//MARK :- Example
//APAlertView.shared.showAlertView(with: alertTitle, message: alertMessage, buttonTitle: "OK", alertBackgroundColor: .blue, alertTextColor: .white, alertButtonTextColor: .blue, alertButtonBackgroundColor: .white)
