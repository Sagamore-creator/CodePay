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

/*

 GET
 /transaction - returns all Transaction instances (all resources available for this endpoint)
 /transaction/{id} - returns Transaction with specified id

 POST
 /transaction - saves Transaction, specified in request body, to endpoint resources.

 DELETE
 /account/{id} - deletes Transaction with specified id from endpoint resources

 */
