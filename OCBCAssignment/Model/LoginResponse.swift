//
//  LoginResponse.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct LoginResponse: Codable {
    let status: String
    let token: String?
    let username: String?
    let accountNo: String?
    let error: String?
}

struct LoginRequest: Codable {
    let username: String
    let password: String
}
