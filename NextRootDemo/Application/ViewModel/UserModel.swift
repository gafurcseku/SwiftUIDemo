//
//  UserModel.swift
//  NextRootDemo
//
//  Created by RootNext15 on 21/7/23.
//

import Foundation

struct UserModel : Decodable {
    
    let users : [Users]?
    
    enum CodingKeys: String, CodingKey {
        
        case users = "results"
    }
}
