//
//  ContentView.swift
//  NextRootDemo
//
//  Created by Md Abdul Gafur on 10/6/23.
//

import SwiftUI
import Introspect

struct UserLoginView: View {
    @StateObject var viewModel = UserLoginViewModel()
    @State var userName:String = ""
    @State var password: String = ""
    @State private var showHidePass = false
    @State private var message:String = ""
    @State private var error:Bool = false
    @State private var userLogin:Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 30){
                VStack(alignment: .leading, spacing: 10){
                    Text("User Name").font(.system(size: 16)).foregroundColor(Color("000000"))
                        .accessibilityIdentifier("userNameLabel")
                    
                    TextField("User Name", text: self.$userName)
                        .accessibilityIdentifier("userNameText")
                        .colorMultiply(Color.black)
                        .keyboardType(.default)
                        .padding(.horizontal, 15)
                        .padding([.top,.bottom], 15)
                        .background(Color("EBEBEB"))
                        .cornerRadius(6)
  
                }
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text("Password").font(.system(size: 16)).foregroundColor(Color("000000"))
                        .accessibilityIdentifier("passwordLabel")
                    HStack{
                        if showHidePass{
                            TextField("Password", text: self.$password)
                                .accessibilityIdentifier("passwordText")
                                .keyboardType(.default)
                            
                        }else{
                            SecureField("Password", text: $password)
                                .accessibilityIdentifier("securepasswordText")
                                .keyboardType(.default)
                        }
                        
                        Button(action: {
                            self.showHidePass.toggle()
                        }) {
                            Image(systemName: showHidePass ? "eye.slash" : "eye")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 20, height: 15)
                                .foregroundColor(Color.gray.opacity(0.75))
                        }
                        .accessibilityIdentifier("passwordShowHide")
                    }
                    
                    .padding(.horizontal, 15)
                    .padding([.top,.bottom], 15)
                    .background(Color("EBEBEB"))
                    .cornerRadius(6)
                }
                
                Button(action: {
                    viewModel.setUserLogin(userName: self.userName, password: self.password) { message, status in
                        if(status){
                            self.userLogin = true
                        }else{
                            self.message = message
                            self.error = true
                        }
                    }
                }) {
                    HStack{
                        Spacer()
                        Text("Login").font(.system(size: 18)).foregroundColor(Color.white)
                        Spacer()
                        Image(systemName: "arrow.right")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(Color.white)
                    }
                    .padding(.horizontal, 20)
                }
                .accessibilityIdentifier("loginButton")
                .padding([.top, .bottom], 12)
                .background(Color("000000"))
                .cornerRadius(5)
            }
            .alert(isPresented: $error) {
                Alert(title: Text("User Login Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
            }
            .padding([.leading,.trailing],15)
            
            Spacer()
            
            
        }
        .fullScreenCover(isPresented: self.$userLogin, content: {
            WelcomeView()
        })
        .background(Color("F8F8F8"))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

extension  UITextView {
    @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
        self.resignFirstResponder()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginView()
    }
}
