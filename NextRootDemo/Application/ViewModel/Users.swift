//
//  Users.swift
//  NextRootDemo
//
//  Created by RootNext15 on 21/7/23.
//

import Foundation

struct Users : Decodable {
    let userName : String?
    let password : String?
    
    enum CodingKeys: String, CodingKey {
        case userName = "userName"
        case password = "password"
    }
}
