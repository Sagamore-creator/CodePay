//  Created by Lech Lipnicki on 2021-05-04.
//

import Foundation

typealias Accounts = [AccountResponse]

struct AccountResponse: Decodable {
    let id: Int
    let phoneNumber: String
    let currency: String
    let balance: Decimal
}

/*

 GET
 /account - returns all Account instances
 /account/{id} - returns Account with specified id

 POST
 /account - saves Account, specified in request body, to endpoint resources

 PUT
 /account/{id} - updates Account with specified id with values, provided in request body

 DELETE
 /account/{id} - deletes Account with specified id from endpoint resources

 */
