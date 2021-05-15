//  Created by Lech Lipnicki on 2021-05-13.
//

import Foundation

extension API {

    final class TransactionsRoute: Route<Transactions> {
        private static let endpoint = "/transaction/"

        struct Params: Encodable {
            let transaction: TransactionResponse
        }

        ///        GET - returns all Transaction instances
        static func get() -> Route<Transactions> {
            .init(endpoint: endpoint)
        }

        ///        GET - returns Transaction with specified id
        static func get(id: String) -> Route<Transactions> {
            .init(endpoint: endpoint + id)
        }

        ///        POST - saves Transaction, specified in request body, to endpoint resources.
        static func post(transaction params: Params) -> Route<Transactions> {
            .init(
                endpoint: endpoint,
                method: .post,
                params: params.transaction
            )
        }

        ///        DELETE - deletes Transaction with specified id from endpoint resources
        static func delete(id: String) -> Route<Transactions> {
            .init(
                endpoint: endpoint + id,
                method: .delete
            )
        }
    }
}
