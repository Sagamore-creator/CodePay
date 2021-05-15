//  Created by Lech Lipnicki on 2021-05-04.
//

import Foundation

typealias Transactions = [TransactionResponse]

struct TransactionResponse: Codable {
    let id: String
    let senderId: String
    let receiverId: String
    let amount: Decimal
    let currency: String
    let createdOn: Int
    let reference: String
}
