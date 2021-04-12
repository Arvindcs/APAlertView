//
//  ContentView.swift
//  APAlertView
//
//  Created by Arvind on 12/04/21.
//

import SwiftUI

@available(iOS 13.0, *)
struct ContentView: View {
    
    let alertTitle   = "Alert Title"
    let alertMessage = "Request could not be processed due to a server error. The request may succeed if you try again."
    let type2BgColor = Color(red: 0.93, green: 0.42, blue: 0.30)
    let type3BgColor = Color(red: 0.40, green: 0.49, blue: 0.92)
    let type3BgColor = Color(red: 244/255, green: 132/255, blue: 177/255)
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Alert Type 1")
                .frame(width: 200, height: 40)
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(6)
                .onTapGesture {
                    APAlertView.shared.showAlertView(with: alertTitle,
                                                     message: alertMessage,
                                                     buttonTitle: "OK")
                }
            
            Text("Show Alert Type 2")
                .frame(width: 200, height: 40)
                .foregroundColor(.white)
                .background(type2BgColor)
                .cornerRadius(6)
                .onTapGesture {
                    APAlertView.shared.showAlertView(with: alertTitle,
                                                     message: alertMessage,
                                                     buttonTitle: "OK",
                                                     alertBackgroundColor: type2BgColor,
                                                     alertTextColor: .white,
                                                     alertButtonTextColor: .black,
                                                     alertButtonBackgroundColor: .white)
                }
            
            Text("Show Alert Type 3")
                .frame(width: 200, height: 40)
                .foregroundColor(.white)
                .background(type3BgColor)
                .cornerRadius(6)
                .onTapGesture {
                    APAlertView.shared.showAlertView(with: alertTitle,
                                                     message: alertMessage,
                                                     buttonTitle: "OK",
                                                     alertBackgroundColor: type3BgColor,
                                                     alertTextColor: .white,
                                                     alertButtonTextColor: .black,
                                                     alertButtonBackgroundColor: .white)
                }
            
            Text("Show Alert Type 4")
                .frame(width: 200, height: 40)
                .foregroundColor(.white)
                .background(type3BgColor)
                .cornerRadius(6)
                .onTapGesture {
                    APAlertView.shared.showAlertView(with: alertTitle,
                                                     message: alertMessage,
                                                     buttonTitle: "OK",
                                                     alertBackgroundColor: type3BgColor,
                                                     alertTextColor: .white,
                                                     alertButtonTextColor: .black,
                                                     alertButtonBackgroundColor: .white)
                }
        }
    }
}

@available(iOS 13.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
