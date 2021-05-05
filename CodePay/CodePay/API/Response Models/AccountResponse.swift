//
//  AccountResponse.swift
//  CodePay
//
//  Created by Lech Lipnicki on 2021-05-04.
//

import Foundation

struct AccountResponse: Codable {
    let id: Int // 1-100 range
    let phoneNumber: String
    let currency: String // EUR, USD etc.
    let balance: Decimal
}
