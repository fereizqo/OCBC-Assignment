//
//  BalanceResponse.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 24/05/22.
//

import SwiftUI

struct BalanceResponse: Codable {
    let status: String
    let error: String?
    let accountNo: String?
    let balance: Double?
}
