APAlertView
=============

[![swiftUI](https://img.shields.io/badge/SWIFTUI-green)](https://developer.apple.com/documentation/swiftui)
[![InstaGram](https://img.shields.io/badge/Instagram-arvind_iOSDev-brightgreen)](https://www.instagram.com/arvind_iosdev)


APAlertView is written in SwiftUI. You can show a alertview or actionsheet only writing a single line of code. it pretty straight forward and you don't want need to write repatative code for all views.

Screenshots
---------
<img src="https://github.com/Arvindcs/APAlertView/blob/main/images/screenshot.png" width="700" height="475"/>


#### If you like the project, don't forget to `put star 🌟`.

</a>&nbsp;&nbsp;&nbsp;<a href="https://paypal.me/arvindp07" target="_blank"><img src="https://img.shields.io/badge/Donate-informational?style=for-the-badge&logo=paypal&logoColor=white" ></a>

Setup Instructions
------------------
[Swift Package Manager](https://www.swift.org/getting-started/#package-manager)
For adding it as a Swift Package in Xcode 13.0 or later, select File > Add Packages > then add the repository URL 

https://github.com/Arvindcs/APAlert.git

## Manually

Drag `APAlertView.swift` , `View+Extention.swift` and  `ViewModifier.swift` to your project.

## Requirements
* iOS 13+
* Xcode 11+

AlertView Examples
---------
```swift

import SwiftUI

struct ContentView: View {
    
    //STEP:- 1
    @StateObject var alertView = APAlertView()

    var body: some View {
        VStack(spacing: 30) {
            Button("Show Default Alert") {
                alertView.showAlertView(title: "Alert", message: "Some Message", primaryCompletion: ("OK", {
                    debugPrint("OK")
                }))
            }
        }.initializeAlert(alertView)  //STEP:- 2
    }
}

```

ActionSheet Examples
---------
```swift

import SwiftUI

struct ContentView: View {
    
    //STEP:- 1
    @StateObject var actionSheet = APAlertView()

    var body: some View {
        VStack(spacing: 30) {
          Button("Show ActionSheet") {
             alertView.showActionSheet(title: "ActionSheet", message: "Message" , primaryCompletion: ("Add", {
                    debugPrint("Add")
                }), secondaryCompletion: ("Delete", {
                    debugPrint("Delete")
                }), dissmissCompletion: ("Cancel", {
                    debugPrint("Cancel")
                }))
          }
        }.initializeAlertActionSheet(alertView.actionSheet) //STEP:- 2
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

<img src="https://github.com/Arvindcs/APAlertView/blob/main/images/banner.gif"></a>
