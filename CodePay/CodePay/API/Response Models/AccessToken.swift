//  Created by Lech Lipnicki on 2021-05-13.
//

import Foundation

struct AccessTokenResponse: Decodable {
    let accessToken: String
    let expiresIn: Int
}
