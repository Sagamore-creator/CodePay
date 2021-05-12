//  Created by Lech Lipnicki on 2021-05-13.
//

import Foundation

struct CheckUserTokenResponse: Decodable {
    let accessToken: String
    let expiresIn: Int
}


/*

 GET
 /user/{id} - this should be used for user authentication. For user id in range 1-100 you get accessToken and expiration time:

 {
     "accessToken": "2e046490-3325-4ec6-8c5c-a524fdb765df",
     "expiresIn": 600
 }
 
 */
