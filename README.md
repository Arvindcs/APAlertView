<img src="https://github.com/Arvindcs/APAlertView/blob/main/images/banner.gif"></a>

APAlertView
=============

[![swiftUI](https://img.shields.io/badge/SWIFTUI-green)](https://developer.apple.com/documentation/swiftui)
[![InstaGram](https://img.shields.io/badge/Instagram-CodewithArvind-brightgreen)](https://www.instagram.com/codewitharvind)


APAlertView is written in SwiftUI. You can show a alertview only writing a signle line of code. it pretty straight forward and you want need to write repatative code for all views.

Screenshots
---------
<img src="https://github.com/Arvindcs/APAlertView/blob/main/images/screenshot.png"></a>


#### If you like the project, don't forget to `put star 🌟`.

</a>&nbsp;&nbsp;&nbsp;<a href="https://paypal.me/arvindp07" target="_blank"><img src="https://img.shields.io/badge/Donate-informational?style=for-the-badge&logo=paypal&logoColor=white" ></a>

Setup Instructions
------------------
[CocoaPods](http://cocoapods.org)
------------------
To integrate APAlertView into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
pod 'APAlertView'
```
and in your code add `import APAlertView`.

## Manually

Drag `APAlertView.swift` to your project.

## Requirements
* iOS 13+
* Xcode 11+

Basic Examples
---------
```swift

struct ContentView: View {
    
    let alertTitle   = "Alert Title"
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
```

## 📃 License

MIT License

Copyright (c) 2022 Arvind Patel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
