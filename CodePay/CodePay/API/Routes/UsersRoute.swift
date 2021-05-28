//  Created by Lech Lipnicki on 2021-05-13.
//

import Foundation

extension API {

    final class UsersRoute: Route<Users> {
        private static let endpoint = "/user/"

        struct Params: Encodable {
            let user: UserResponse
        }

        struct PhoneNumberQuery: Encodable {
            let phoneNumber: String?
        }

        struct SearchQuery: Encodable {
            let search: String
        }

        ///        GET - returns all User instances
        static func get() -> Route<Users> {
            .init(endpoint: endpoint)
        }

        ///        GET - gets all users with specified phoneNumber
        static func get(with phoneNumber: String?) -> Route<Users> {
            .init(
                endpoint: endpoint, //"/user",
                params: PhoneNumberQuery(phoneNumber: phoneNumber)
            )
        }

        ///        POST - saves user
        static func post(user params: Params) -> Route<Users> {
            .init(
                endpoint: endpoint,
                method: .post,
                params: params.user
            )
        }

        ///        PUT - updates User with specific id with values, provided in request body
        static func update(id: String, user params: Params) -> Route<Users> {
            .init(
                endpoint: endpoint + id,
                method: .put,
                params: params.user
            )
        }

        ///        DELETE - deletes User with specified id from endpoint resources
        static func delete(id: String) -> Route<Users> {
            .init(
                endpoint: endpoint + id,
                method: .delete
            )
        }
    }
}
