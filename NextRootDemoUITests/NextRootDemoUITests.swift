//
//  NextRootDemoUITests.swift
//  NextRootDemoUITests
//
//  Created by Md Abdul Gafur on 10/6/23.
//

import XCTest

final class NextRootDemoUITests: XCTestCase {
    let app = XCUIApplication()
   
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        continueAfterFailure = false
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUserLoginForm() throws {
        let userLabel = UserLoginScreen.texts.userNameText
        XCTAssert(userLabel.exists)
        
        let passwordLabel = UserLoginScreen.texts.passwordText
        XCTAssert(passwordLabel.exists)
        
        let userName = UserLoginScreen.textEditors.userNameTextEditor
        XCTAssert(userName.exists)
        
        let securepasswordText = UserLoginScreen.textEditors.secureTextEditor
        XCTAssert(securepasswordText.exists)
        
        UserLoginScreen.buttons.passToggleButton.tap()
        
        let password = UserLoginScreen.textEditors.passwordTextEditor
        XCTAssert(password.exists)
        
       
        let toggleButoon = UserLoginScreen.buttons.passToggleButton
        XCTAssert(toggleButoon.exists)
        
        let userLoginButon = UserLoginScreen.buttons.loginButton
        XCTAssert(userLoginButon.exists)
    }

    func testUserLogin() throws {
        UserLoginScreen.LoginTest()
        XCTAssert(UserLoginScreen.texts.welcomeText.waitForExistence(timeout: 5.0))
    }
    
    func testUserLoginFail() throws {
        UserLoginScreen.LoginTestWrong()
        XCTAssertFalse(UserLoginScreen.texts.welcomeText.waitForExistence(timeout: 10.0))
    }
    
    func testUserLoginFailAlert() throws {
        UserLoginScreen.LoginTestWrong()
        XCTAssert(app.alerts.element.waitForExistence(timeout: 5.0))
        app.alerts.element.buttons["Ok"].tap()
        XCTAssertFalse(app.alerts.element.exists)
    }
    
    func testUserName() throws {
        UserLoginScreen.testUserName()
        XCTAssertNotEqual(UserLoginScreen.textEditors.userNameTextEditor.value as! String, "")
    }
    
    func testPassword() throws {
        UserLoginScreen.testPassword()
        XCTAssertNotEqual(UserLoginScreen.textEditors.secureTextEditor.value as! String, "")
    }
    
    func testUserNameValidate() throws {
        UserLoginScreen.buttons.loginButton.tap()
        XCTAssert(app.alerts.element.waitForExistence(timeout: 10))
        app.alerts.element.buttons["Ok"].tap()
        XCTAssertFalse(app.alerts.element.exists)
    }
    
    func testPasswordValidate() throws {
        UserLoginScreen.textEditors.userNameTextEditor.tap()
        UserLoginScreen.textEditors.userNameTextEditor.typeText("NextRo")
        
        UserLoginScreen.buttons.loginButton.tap()
        XCTAssert(app.alerts.element.waitForExistence(timeout: 10.0))
        app.alerts.element.buttons["Ok"].tap()
        XCTAssertFalse(app.alerts.element.exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
