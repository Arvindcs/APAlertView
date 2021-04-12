
import Foundation
import SwiftUI

@available(OSX 10.15, *)
private struct AlertView: View {
    
    let loaderBackgroundColor: Color = .secondary
    let loaderCornerRadius: CGFloat =  10.0
    
    /// parameter to hide and show loader
    @Binding var isShowing: Bool
    
    let titleText: String
    let messageText: String
    let buttonText: String
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            VStack(spacing: 10) {
                
                if titleText.count > 0 {
                    Text(titleText)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                }
                
                Text(messageText)
                    .multilineTextAlignment(.center)
                    .frame(height: 50)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button(action: {
                    APAlert.shared.remove()
                }) {
                    Text(buttonText)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .frame(width: 130, height: 40)
                .background(Color.black)
                .cornerRadius(20.0)
            }
            .padding(EdgeInsets(top: 40, leading: 20, bottom: 30, trailing: 20))
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(10.0)
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
        }
    }
}

public class APAlert {
    public static var shared = APAlert()
    private init() { }
    private var popupWindow: AlertWindow?
    
    public func startloader(title: String = "", message: String = "", buttonTitle: String = "") {
        setAlertBody(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    /// function to remove loader from screen.
    public func remove() {
        removeAlert()
    }
    
}

// MARK: - AlertWindow

private class AlertWindow: UIWindow {
}

private extension APAlert {
    
    func setAlertBody(title: String = "", message: String = "", buttonTitle: String = "") {
        
        let windowScene = UIApplication.shared
            .connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first
        
        if let windowScene = windowScene as? UIWindowScene {
            popupWindow = AlertWindow(windowScene: windowScene)
            popupWindow?.frame = UIScreen.main.bounds
            popupWindow?.backgroundColor = .clear
            popupWindow?.rootViewController = UIHostingController(rootView: AlertView(isShowing: .constant(true), titleText: title, messageText: message, buttonText: buttonTitle))
            popupWindow?.rootViewController?.view.backgroundColor = UIColor.gray.withAlphaComponent(0.6) //.opacity(0.5)
            popupWindow?.makeKeyAndVisible()
        }
    }
    /// Remove loader from screen
    func removeAlert() {
        let alertwindows = UIApplication.shared.windows.filter { $0 is AlertWindow }
        alertwindows.forEach { (window) in
            window.removeFromSuperview()
        }
        popupWindow = nil
    }
}
