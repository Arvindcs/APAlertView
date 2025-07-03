//
//  APAlertViewTests.swift
//  APAlertViewTests
//
//  Created by Arvind on 12/04/21.
//

import XCTest
@testable import APAlertView

final class APAlertViewTests: XCTestCase {
    
    func testAPAlertViewInitialization() throws {
        let alertView = APAlertView()
        XCTAssertNotNil(alertView)
    }
    
    func testAlertConfigurationCreation() throws {
        let configuration = AlertConfiguration(
            title: "Test Alert",
            message: "This is a test alert",
            primaryButton: AlertButton(title: "OK") {}
        )
        
        XCTAssertEqual(configuration.title, "Test Alert")
        XCTAssertEqual(configuration.message, "This is a test alert")
        XCTAssertEqual(configuration.primaryButton.title, "OK")
    }
    
    func testConfirmationDialogConfigurationCreation() throws {
        let configuration = ConfirmationDialogConfiguration(
            title: "Test Confirmation Dialog",
            message: "Choose an action",
            buttons: [
                AlertButton(title: "Action 1") {},
                AlertButton(title: "Action 2") {}
            ]
        )
        
        XCTAssertEqual(configuration.title, "Test Confirmation Dialog")
        XCTAssertEqual(configuration.message, "Choose an action")
        XCTAssertEqual(configuration.buttons.count, 2)
    }
} 