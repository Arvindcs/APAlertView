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
                APAlertView.shared.startloader(title: "Alert Title", message: "Please Follow me on github and instagram", buttonTitle: "OK")
            }
    }
}
@available(iOS 13.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
