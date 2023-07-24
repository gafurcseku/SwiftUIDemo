//
//  UserLoginViewModel.swift
//  NextRootDemo
//
//  Created by Md Abdul Gafur on 10/6/23.
//
import Foundation
import FirebaseCore
import FirebaseFirestore
import Alamofire
import WiremockClient


class UserLoginViewModel : ObservableObject {
    
    let db = Firestore.firestore()
    
    func setUserLogin(userName:String,password:String, complete:@escaping (String, Bool) -> Void){
        var done = true
        if(!validateUserName(userName)){
            done = false
            complete("Username Must be greater than 3 character",false)
        }else if(validatePassword(password)){
            done = false
            complete("Password at least 8-20 characters with special character and upper & lowercase alphabet",false)
        }
        if(done){
            if Helper.shouldRunLocal() {
                let parameters: Parameters = [
                        "userName": userName,
                        "password":password
                        ]
                AF.request("\(WiremockClient.baseURL)/rootnext/api/user",method: .get,parameters: parameters).validate().responseDecodable(of: UserModel.self) { (response) in
                    print(response)
                    switch response.result {
                    case .success( let data):
                        if let user = data.users {
                            let userName = user[0].userName ?? ""
                            Helper.setuserName(to: userName)
                            complete("Login Ok",true)
                        }
                    case .failure(let error):
                        complete("User Login fail. with error \(error.localizedDescription)",false)
                    }
                   
                }
                
            }else{
                db.collection("users").whereField("password",isEqualTo: password).whereField("userName",isEqualTo: userName).getDocuments { (querySnapshot, err) in
                    if let err = err {
                        complete("Error for Login: \(err)",false)
                    } else {
                        if let querySnapshot = querySnapshot {
                            if(querySnapshot.count > 0){
                                let data = querySnapshot.documents[0].data()
                                let userName = data["userName"] as? String ?? ""
                                Helper.setuserName(to: userName)
                                complete("Login Ok",true)
                            }else{
                                complete("User Login fail. Please check userName and Password",false)
                            }
                        }
                        for document in querySnapshot!.documents {
                            print("\(document.documentID) => \(document.data())")
                        }
                    }
                    
                }
            }
            
        }
    }
    
    
    
    
    fileprivate func validateUserName(_ userName:String) -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", "\\A\\w{4,12}\\z").evaluate(with: userName)
    }
    
    fileprivate func validatePassword(_ password:String) -> Bool {
        if(password.isEmpty){
            return true
        }else if(NSPredicate(format:"SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,16}").evaluate(with: password)){
            return false
        }else{
            return false
        }
    }
    
}
