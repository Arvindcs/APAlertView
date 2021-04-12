
import Foundation
import SwiftUI


@available(iOS 13.0, *)
private struct AlertView: View {
    
    //MARK: Binding
    @Binding var isShowing: Bool
   
    //MARK: variables for view
    let titleText: String
    let messageText: String
    let buttonText: String
    let alertBackgroundColor: Color
    let alertTextColor: Color
    let alerteButtonTextColor: Color
    let alertButtonBackgroundColor: Color
    
    //MARK: body
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
                    .foregroundColor(alertTextColor)
                    .padding(.bottom , 20)
                
                Button(action: {
                    APAlertView.shared.removeAlert()
                }) {
                    Text(buttonText)
                        .font(.system(size: 14))
                        .foregroundColor(alerteButtonTextColor)
                        .fontWeight(.bold)
                }
                .frame(width: 130, height: 40)
                .background(alertButtonBackgroundColor)
                .cornerRadius(20)
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
    
    func showAlertView(with title: String = "",
                       message: String = "",
                       buttonTitle: String = "",
                       alertBackgroundColor: Color = .white,
                       alertTextColor: Color = .black,
                       alertButtonTextColor: Color = .white,
                       alertButtonBackgroundColor: Color = .black) {
        
        let windowScene = UIApplication.shared
            .connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first
        
        let alertView = AlertView(isShowing:  .constant(true),
                                  titleText: title,
                                  messageText: message,
                                  buttonText: buttonTitle,
                                  alertBackgroundColor: alertBackgroundColor,
                                  alertTextColor: alertTextColor,
                                  alerteButtonTextColor: alertButtonTextColor,
                                  alertButtonBackgroundColor: alertButtonBackgroundColor)
            
        
        if let windowScene = windowScene as? UIWindowScene {
            popupWindow = AlertWindow(windowScene: windowScene)
            popupWindow?.frame = UIScreen.main.bounds
            popupWindow?.backgroundColor = .clear
            popupWindow?.rootViewController = UIHostingController(rootView: alertView)
            popupWindow?.rootViewController?.view.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
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

// MARK: - AlertWindow
private class AlertWindow: UIWindow {
}
