//
//  ContentView.swift
//  APAlertView
//
//  Created by Arvind on 12/04/21.
//

import SwiftUI

@available(iOS 13.0, *)
struct ContentView: View {
    
    var body: some View {
        
        Text("Show Alert")
            .frame(width: 200, height: 40)
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(6)
            .onTapGesture {
                APAlertView.shared.showAlertView(title: "Alert Title", message:  "Request could not be processed due to a server error. The request may succeed if you try again.", buttonTitle: "OK")
            }
    }
}

@available(iOS 13.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
