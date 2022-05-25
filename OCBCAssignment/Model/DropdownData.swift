//
//  DropdownData.swift
//  OCBCAssignment
//
//  Created by Fereizqo Sulaiman on 25/05/22.
//

import Foundation

struct DropdownData: Hashable {
    let key: String
    let value: String
    
    public static func == (lhs: DropdownData, rhs: DropdownData) -> Bool {
        return lhs.key == rhs.key
    }
}
