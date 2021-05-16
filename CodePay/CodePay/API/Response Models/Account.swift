//  Created by Lech Lipnicki on 2021-05-04.
//

import Foundation

typealias Accounts = [AccountResponse]
typealias Account = AccountResponse

struct AccountResponse: Codable {
    let id: String?
    let phoneNumber: String
    let currency: String
    let balance: Double?
}
