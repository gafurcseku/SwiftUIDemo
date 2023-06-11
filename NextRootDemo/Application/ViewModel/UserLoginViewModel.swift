//
//  UserLoginViewModel.swift
//  NextRootDemo
//
//  Created by Md Abdul Gafur on 10/6/23.
//
import Foundation
import FirebaseCore
import FirebaseFirestore


class UserLoginViewModel : ObservableObject {
    
    let db = Firestore.firestore()
    
    func setUserLogin(userName:String,password:String, complete:@escaping (String, Bool) -> Void){
        var done = true
        if(validateUserName(userName)){
            done = false
            complete("User Name Must be with 5-7 character",false)
        }else if(validatePassword(password)){
            done = false
            complete("Password is not Empty",false)
        }
        if(done){
            db.collection("users").whereField("password",isEqualTo: password).whereField("userName",isEqualTo: userName).getDocuments { (querySnapshot, err) in
                if let err = err {
                    complete("Error for Login: \(err)",false)
                } else {
                    if let querySnapshot = querySnapshot {
                        if(querySnapshot.count > 0){
                            let data = querySnapshot.documents[0].data()
                            complete(data["userName"] as? String ?? "",true)
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
    
    
    
    
    fileprivate func validateUserName(_ userName:String) -> Bool {
        return !NSPredicate(format:"SELF MATCHES %@", "\\w{5,7}").evaluate(with: userName)
    }
    
    fileprivate func validatePassword(_ password:String) -> Bool {
        return password.isEmpty
    }
    
}
