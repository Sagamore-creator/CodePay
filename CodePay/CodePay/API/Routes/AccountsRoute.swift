//  Created by Lech Lipnicki on 2021-05-13.
//

import Foundation

extension API {

    final class AccountsRoute: Route<Accounts> {
        private static let endpoint = "/account/"

        struct Params: Encodable {
            let account: AccountResponse
        }

        ///        GET - returns all Account instances
        static func get() -> Route<Accounts> {
            .init(endpoint: endpoint)
        }

        ///        GET - returns Account with specified id
        static func get(id: String) -> Route<Accounts> {
            .init(endpoint: endpoint + id)
        }

        ///        POST - saves Account, specified in request body, to endpoint resources
        static func post(account params: Params) -> Route<Accounts> {
            .init(
                endpoint: endpoint,
                method: .post,
                params: params.account
            )
        }

        ///        PUT - updates Account with specified id with values, provided in request body
        static func update(id: String, account params: Params) -> Route<Accounts> {
            .init(
                endpoint: endpoint + id,
                method: .put,
                params: params.account
            )
        }

        ///        DELETE - deletes Account with specified id from endpoint resources
        static func delete(id: String) -> Route<Accounts> {
            .init(
                endpoint: endpoint + id,
                method: .delete
            )
        }
    }
}
