//
//  PayeeReponse.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import Foundation

// MARK: - Welcome
struct PayeeReponse: Codable {
    let status: String
    let error: ErrorResponse?
    let data: [PayeeData]?
}

// MARK: - Datum
struct PayeeData: Codable {
    let id, name, accountNo: String
}
