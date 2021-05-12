//  Created by Lech Lipnicki on 2021-05-04.
//

import Foundation

struct UserResponse: Codable {
    let id: Int // 1-100 range
    let phoneNumber: String
    let password: String
}


/*

 GET
 /user - returns all User instances (all resources available for this endpoint)
 /user/{id} - this should be used for user authentication. For user id in range 1-100 you get accessToken and expiration time:
 
 {
     "accessToken": "2e046490-3325-4ec6-8c5c-a524fdb765df",
     "expiresIn": 600
 }

 POST
 /user - saves user

 PUT
 /user/{id} - updates User with specific id with values, provided in request body

 DELETE
 /user/{id} - deletes User with specified id from endpoint resources

 */
