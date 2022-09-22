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
    
    init(_ email: String,_ password: String) {
        self.email = email
        self.password = password
    }
}

struct CertificationRequest: Codable {
    var key:String
    
    init(_ key: String) {
        self.key = key
    }
}

struct SendEmailRequest: Codable {
    var email:String
    
    init(_ email: String) {
        self.email = email
    }
}

struct ForgotRequest: Codable {
    var email: String
    var newPassword: String
    
    init(_ email: String,_ newPassword: String) {
        self.email = email
        self.newPassword = newPassword
    }
}
