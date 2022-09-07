//
//  Request.swift
//  Job-GSM
//
//  Created by 선민재 on 2022/09/06.
//

import Foundation

struct SigninRequest: Codable {
    var email: String
    var password: String
    
    init(_ email: String,_ password: String) {
        self.email = email
        self.password = password
    }
}

struct SignupRequest: Codable {
    var email: String
    var password: String
    var username: String
    
    init(_ email: String,_ password: String,_ username: String) {
        self.email = email
        self.password = password
        self.username = username
    }
}
