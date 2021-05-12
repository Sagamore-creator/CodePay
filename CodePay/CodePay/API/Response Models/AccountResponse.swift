//  Created by Lech Lipnicki on 2021-05-04.
//

import Foundation

struct AccountResponse: Codable {
    let id: Int // 1-100 range
    let phoneNumber: String
    let currency: String // EUR, USD etc.
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
