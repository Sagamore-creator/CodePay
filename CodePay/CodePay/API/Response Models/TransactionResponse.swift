//
//  TransactionResponse.swift
//  CodePay
//
//  Created by Lech Lipnicki on 2021-05-04.
//

import Foundation

struct TransactionResponse: Codable {
    let id: Int // 1-100 range
    let senderId: String
    let receiverId: String
    let amount: Decimal
    let currency: String
    let createdOn: Int // timestamp - since 1970
    let reference: String // purpose of the transaction
}
