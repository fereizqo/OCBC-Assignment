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
struct PayeeData: Codable, Hashable {
    var id, name, accountNo: String
    
    public static func == (lhs: PayeeData, rhs: PayeeData) -> Bool {
        return lhs.id == rhs.id
    }
}
