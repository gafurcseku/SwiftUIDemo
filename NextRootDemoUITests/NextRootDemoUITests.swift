//
//  NextRootDemoUITests.swift
//  NextRootDemoUITests
//
//  Created by Md Abdul Gafur on 10/6/23.
//

import XCTest
import WiremockClient

final class NextRootDemoUITests: XCTestCase {
    let app = XCUIApplication()
   
    override func setUpWithError() throws {
       
        try WiremockClient.postMapping(stubMapping: StubMapping.stubFor(requestMethod: .GET, urlMatchCondition: .urlPathEqualTo, url: "/rootnext/api/user").withQueryParam("userName", matchCondition: .equalTo, value: "nextRo").withQueryParam("password", matchCondition: .equalTo, value: "A123456!a")
            .willReturn(ResponseDefinition().withLocalJsonBodyFile("user", in: Bundle(for: type(of: self))))
        )
        
        continueAfterFailure = false
        app.launchArguments.append(contentsOf: ["-runlocal"])
        app.launch()
        
    }

    override func tearDownWithError() throws {
      // try WiremockClient.reset()
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

    func testLoginWithValidUsernameAndPassword() throws {
        UserLoginScreen.loginWithValidUsernameAndPassword()
        XCTAssert(UserLoginScreen.texts.welcomeText.waitForExistence(timeout: 5.0))
        let message = UserLoginScreen.texts.welcomeText.label
        XCTAssertEqual("Hi \(UserLoginScreen.userName), Welcome to Application", message)
    }
    
    func testLogin_With_Valid_UserName_And_Password_Via_WireMoc() throws {
        UserLoginScreen.loginWithValidUsernameAndPassword()
        XCTAssert(UserLoginScreen.texts.welcomeText.waitForExistence(timeout: 5.0))
        let message = UserLoginScreen.texts.welcomeText.label
        XCTAssertEqual("Hi \(UserLoginScreen.userName), Welcome to Application", message)
    }
    
    func testLoginWithInvalidUsernameAndPassword() throws {
        UserLoginScreen.loginWithInvalidUsernameAndPassword()
        XCTAssertFalse(UserLoginScreen.texts.welcomeText.waitForExistence(timeout: 5.0))
    }
    
    func testInvalidLoginMessage() throws {
        UserLoginScreen.invalidLoginMessage()
        XCTAssert(app.alerts.element.waitForExistence(timeout: 5.0))
        app.alerts.element.buttons["Ok"].tap()
        XCTAssertFalse(app.alerts.element.exists)
    }
    
    func testLoginWithblankUsernameAndPassword() throws {
        UserLoginScreen.loginWithblankUsernameAndPassword()
        XCTAssert(app.alerts.element.waitForExistence(timeout: 5.0))
        app.alerts.element.buttons["Ok"].tap()
        XCTAssertFalse(app.alerts.element.exists)
    }
    
    func testcheckPasswordVisible() throws {
        UserLoginScreen.checkPasswordVisible()
        XCTAssert(UserLoginScreen.textEditors.passwordTextEditor.exists)
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
