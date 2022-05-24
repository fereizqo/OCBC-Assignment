//
//  RegisterResponse.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import Foundation

struct RegisterReponse: Codable {
    let status: String
    let token: String?
    let error: String?
}
