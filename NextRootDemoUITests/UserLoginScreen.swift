//
//  UserLoginScreen.swift
//  NextRootDemoUITests
//
//  Created by Md Abdul Gafur on 11/6/23.
//

import XCTest

final class UserLoginScreen {
    
    static let userName = "nextRo"
    static let password = "A123456!a"
    static let wrongPassword = "A123486!a"
   
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
    
    static func loginWithValidUsernameAndPassword(){
        UserLoginScreen.textEditors.userNameTextEditor.tap()
        UserLoginScreen.textEditors.userNameTextEditor.typeText(userName)
        
        UserLoginScreen.textEditors.secureTextEditor.tap()
        UserLoginScreen.textEditors.secureTextEditor.typeText(password)
        
        XCUIApplication().keyboards.buttons["Return"].tap()
        
        UserLoginScreen.buttons.loginButton.tap()
    }
    
    static func loginWithInvalidUsernameAndPassword(){
        UserLoginScreen.textEditors.userNameTextEditor.tap()
        UserLoginScreen.textEditors.userNameTextEditor.typeText(userName)
        
        UserLoginScreen.textEditors.secureTextEditor.tap()
        UserLoginScreen.textEditors.secureTextEditor.typeText(wrongPassword)
        
        XCUIApplication().keyboards.buttons["Return"].tap()
        
        UserLoginScreen.buttons.loginButton.tap()
    }
    
    static func loginWithblankUsernameAndPassword(){
        
        UserLoginScreen.textEditors.userNameTextEditor.tap()
        UserLoginScreen.textEditors.userNameTextEditor.typeText("")
        
        UserLoginScreen.textEditors.secureTextEditor.tap()
        UserLoginScreen.textEditors.secureTextEditor.typeText("")
        
       // XCUIApplication().keyboards.buttons["Return"].tap()
        
        UserLoginScreen.buttons.loginButton.tap()
        
    }
    
    static func invalidLoginMessage(){
        
        UserLoginScreen.textEditors.userNameTextEditor.tap()
        UserLoginScreen.textEditors.userNameTextEditor.typeText(userName)
        
        UserLoginScreen.textEditors.secureTextEditor.tap()
        UserLoginScreen.textEditors.secureTextEditor.typeText(wrongPassword)
        
        XCUIApplication().keyboards.buttons["Return"].tap()
        
        UserLoginScreen.buttons.loginButton.tap()
        
    }
    
    static func checkPasswordVisible(){
        UserLoginScreen.textEditors.secureTextEditor.tap()
        UserLoginScreen.textEditors.secureTextEditor.typeText(password)
        UserLoginScreen.buttons.passToggleButton.tap()
    }
    
    static func testUserName(){
        UserLoginScreen.textEditors.userNameTextEditor.tap()
        UserLoginScreen.textEditors.userNameTextEditor.typeText(userName)
    }
    
    static func testPassword(){
        UserLoginScreen.textEditors.secureTextEditor.tap()
        UserLoginScreen.textEditors.secureTextEditor.typeText(password)
    }
}
