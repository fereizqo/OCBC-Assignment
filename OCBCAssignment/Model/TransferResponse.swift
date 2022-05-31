//
//  TransferResponse.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import Foundation

struct TransferResponse: Codable {
    let status: String
    let error: String?
    let transactionId: String?
    let amount: Double?
    let description: String?
    let recipientAccount: String?
}

struct TransferRequest: Codable {
    let receipientAccountNo: String
    let amount: Int
    let description: String
}
