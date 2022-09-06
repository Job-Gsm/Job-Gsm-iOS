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
    
    init(_ id: String,_ password: String) {
        self.email = id
        self.password = password
    }
}

struct SignupRequest: Codable {
    var email: String
    var password: String
    
    init(_ id: String,_ password: String) {
        self.email = id
        self.password = password
    }
}
