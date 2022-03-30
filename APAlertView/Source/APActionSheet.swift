//
//  APActionSheet.swift
//  APAlertView
//
//  Created by Arvind on 30/03/22.
//  Copyright © 2022 Arvind. All rights reserved.
//

import SwiftUI

public class APActionSheet: ObservableObject {
    
    // MARK: Published
    @Published public var showActionSheet : Bool = false
    
    // MARK: Properties
    private var title : String = ""
    private var message : String = ""
    
    private var firstButtonTitle: String = "OK"
    private var secondButtonTitle: String = ""
    
    private var actionSheetOneCompletion: () -> () = {}
    private var actionSheetTwoCompletion: () -> () = {}
    
    // MARK: A representation for an ActionSheet presentation.
    var getActionSheet: ActionSheet {
        
        let action1 = ActionSheet.Button.default(Text("First action")) {
            self.actionSheetOneCompletion()
        }
        
        let action2 = ActionSheet.Button.default(Text("Second action")) {
            self.actionSheetTwoCompletion()
        }
        
        let action3 = ActionSheet.Button.cancel(Text("Cancel")) {
            self.actionSheetTwoCompletion()
        }
        
        return ActionSheet(title: Text(title), message: Text(message), buttons: [action1, action2, action3])
    }
    
    
    //MARK:- Default Alert View
    public func showActionSheet(title: String = "",
                                message: String = "",
                                firstButtonTitle: String,
                                secondButtonTitle: String,
                                defaultCompletionHandler: @escaping () -> (),
                                secondCompletionHandler: @escaping () -> ()) {
        self.title = title
        self.message = message
        
        self.firstButtonTitle = firstButtonTitle
        self.actionSheetOneCompletion = defaultCompletionHandler
        
        self.secondButtonTitle = secondButtonTitle
        self.actionSheetTwoCompletion = secondCompletionHandler
        
        self.showActionSheet = true
    }
}

public struct ActionSheetModifier: ViewModifier {
    
    @ObservedObject var actionSheet: APActionSheet
    
    public func body(content: Content) -> some View {
        content.actionSheet(isPresented:$actionSheet.showActionSheet, content: {
            actionSheet.getActionSheet
        })
    }
}

extension View {
    
    public func usesActionSheet(_ alertManager: APActionSheet) -> some View {
        self.modifier(ActionSheetModifier(actionSheet: alertManager))
    }
}
