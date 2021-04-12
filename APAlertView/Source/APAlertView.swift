
import Foundation
import SwiftUI

@available(iOS 13.0, *)
private struct AlertView: View {
    
    let alertBackgroundColor: Color = .white
    let alertTextColor: Color = .black
    let alertCornerRadius: CGFloat =  20.0
    
    @Binding var isShowing: Bool
    
    let titleText: String
    let messageText: String
    let buttonText: String
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            VStack(spacing: 10) {
                
                if titleText.count > 0 {
                    Text(titleText)
                        .foregroundColor(alertTextColor)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                }
                
                Text(messageText)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .padding(.bottom , 20)
                
                Button(action: {
                    APAlertView.shared.remove()
                }) {
                    Text(buttonText)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
                .frame(width: 130, height: 40)
                .background(Color.black)
                .cornerRadius(alertCornerRadius)
            }
            .padding(EdgeInsets(top: 40, leading: 20, bottom: 30, trailing: 20))
            .frame(width: 300)
            .background(alertBackgroundColor)
            .cornerRadius(10.0)
            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
        }
    }
}

@available(iOS 13.0, *)
public class APAlertView {
    public static var shared = APAlertView()
    private init() { }
    private var popupWindow: AlertWindow?
    
    public func showAlertView(title: String = "", message: String = "", buttonTitle: String = "") {
        setAlertBody(title: title, message: message, buttonTitle: buttonTitle)
    }
    
    public func remove() {
        removeAlert()
    }
    
}

// MARK: - AlertWindow

private class AlertWindow: UIWindow {
}

@available(iOS 13.0, *)
private extension APAlertView {
    
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

    func removeAlert() {
        let alertwindows = UIApplication.shared.windows.filter { $0 is AlertWindow }
        alertwindows.forEach { (window) in
            window.removeFromSuperview()
        }
        popupWindow = nil
    }
}
