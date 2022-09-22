//
//  Model.swift
//  Job-GSM
//
//  Created by 선민재 on 2022/09/06.
//

import Foundation


struct SignupModel: Codable {
    let status: Int
    let success: Bool
    let message: String
}
struct SigninModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SigninResponse
}

struct CertificationModel: Codable {
    let status: Int
    let success: Bool
    let message: String
}

struct SendEmailModel: Codable {
    let status: Int
    let success: Bool
    let message: String
}

struct ForgotPWModel: Codable {
    let status: Int
    let success: Bool
    let message: String
}

struct SigninResponse: Codable {
    let email: String
}

