//
//  Helper.swift
//  NextRootDemo
//
//  Created by Md Abdul Gafur on 12/6/23.
//

import Foundation

struct Helper {
    
    static var getUserName: String {
        return UserDefaults.standard.string(forKey: "UserName") ?? "Guest"
    }
    
    static func setuserName(to userName:String) {
        UserDefaults.standard.set(userName, forKey: "UserName")
        UserDefaults.standard.synchronize()
    }
}
