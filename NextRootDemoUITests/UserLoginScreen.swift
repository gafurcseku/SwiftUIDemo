//
//  UserLoginScreen.swift
//  NextRootDemoUITests
//
//  Created by Md Abdul Gafur on 11/6/23.
//

import XCTest

final class UserLoginScreen {
    
    struct Texts{
        let userNameText:XCUIElement
        let passwordText:XCUIElement
        let welcomeText:XCUIElement
    }
    
    struct TextEditors {
        let userNameTextEditor:XCUIElement
        let passwordTextEditor:XCUIElement
        let secureTextEditor:XCUIElement
    }
    
    struct Buttons {
        let passToggleButton:XCUIElement
        let loginButton:XCUIElement
    }
    
    static let texts = Texts(
        userNameText: XCUIApplication().staticTexts["userNameLabel"],
        passwordText: XCUIApplication().staticTexts["passwordLabel"],
        welcomeText: XCUIApplication().staticTexts["welcomeLabel"]
    )
    
    static let textEditors = TextEditors(
        userNameTextEditor: XCUIApplication().textFields["userNameText"],
        passwordTextEditor: XCUIApplication().textFields["passwordText"],
        secureTextEditor:XCUIApplication().secureTextFields["securepasswordText"]
    )
    
    static let buttons = Buttons(
        passToggleButton: XCUIApplication().buttons["passwordShowHide"],
        loginButton: XCUIApplication().buttons["loginButton"]
    )
    
    static func LoginTest(){
        UserLoginScreen.textEditors.userNameTextEditor.tap()
        UserLoginScreen.textEditors.userNameTextEditor.typeText("nextRo")
        
        UserLoginScreen.textEditors.secureTextEditor.tap()
        UserLoginScreen.textEditors.secureTextEditor.typeText("123456")
        
        XCUIApplication().keyboards.buttons["Return"].tap()
        
        UserLoginScreen.buttons.loginButton.tap()
    }
    
    static func LoginTestWrong(){
        UserLoginScreen.textEditors.userNameTextEditor.tap()
        UserLoginScreen.textEditors.userNameTextEditor.typeText("NextRo")
        
        UserLoginScreen.textEditors.secureTextEditor.tap()
        UserLoginScreen.textEditors.secureTextEditor.typeText("12345")
        
        XCUIApplication().keyboards.buttons["Return"].tap()
        
        UserLoginScreen.buttons.loginButton.tap()
    }
    
    static func testUserName(){
        UserLoginScreen.textEditors.userNameTextEditor.tap()
        UserLoginScreen.textEditors.userNameTextEditor.typeText("nextRo")
    }
    
    static func testPassword(){
        UserLoginScreen.textEditors.secureTextEditor.tap()
        UserLoginScreen.textEditors.secureTextEditor.typeText("123456")
    }
}
