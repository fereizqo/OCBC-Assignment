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
    let transactionTime: String
    let datumDescription: String?
    let transactionType: String
    let receipient: Receipient
    
    var transactionDate: Date? {
        return transactionTime.toDate(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.sssZ", setLocalTimeZone: false)
    }

    enum CodingKeys: String, CodingKey {
        case transactionID = "transactionId"
        case amount
        case transactionTime = "transactionDate"
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

extension TransactionData: Dated {
    var date: Date {
        return transactionDate ?? Date()
    }
}
