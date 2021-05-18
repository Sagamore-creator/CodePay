//  Created by Lech Lipnicki on 2021-05-14.
//

import Foundation

enum API {
    static let baseURL = "https://608886a3a6f4a30017426912.mockapi.io/api/v5"
}

// MARK: - API methods

extension API {

    static func registerUser(_ user: User) {
        self.UsersRoute.post(user: UsersRoute.Params(user: user)).result { _ in }
    }

    static func registerAccount(_ account: Account) {
        self.AccountsRoute.post(account: AccountsRoute.Params(account: account)).result { _ in }
    }
}