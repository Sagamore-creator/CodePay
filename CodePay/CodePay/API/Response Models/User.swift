//  Created by Lech Lipnicki on 2021-05-04.
//

import Foundation

typealias Users = [UserResponse]

struct UserResponse: Codable {
    let id: String?
    let phoneNumber: String
    let password: String
}
