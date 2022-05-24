//
//  TransactionResponse.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct TransactionResponse: Codable {
    let status: String
    let error: String?
    let data: [TransactionData]?
}

// MARK: - TransactionData
struct TransactionData: Codable {
    let transactionID: String
    let amount: Double
    let transactionDate: String
    let datumDescription: String?
    let transactionType: String
    let receipient: Receipient

    enum CodingKeys: String, CodingKey {
        case transactionID = "transactionId"
        case amount, transactionDate
        case datumDescription = "description"
        case transactionType, receipient
    }
}

// MARK: - Receipient
struct Receipient: Codable {
    let accountNo: String
    let accountHolder: String
}

// MARK: - Error
struct ErrorResponse: Codable {
    let name: String?
    let message: String?
}

