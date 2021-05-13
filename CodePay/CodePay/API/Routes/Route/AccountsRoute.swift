//  Created by Lech Lipnicki on 2021-05-13.
//

import Foundation

final class AccountsRoute: Route<Accounts> {

    static func getAccounts() -> Route<Accounts> {
        .init(
            baseURL: "https://608886a3a6f4a30017426912.mockapi.io/api/v5",
            endpoint: "/account",
            method: .get
        )
    }

    init() {
        super.init(
            baseURL: "https://608886a3a6f4a30017426912.mockapi.io/api/v5",
            endpoint: Endpoint.account.value,
            method: .get
        )
    }
}
