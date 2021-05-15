//  Created by Lech Lipnicki on 2021-05-13.
//

import Foundation

extension API {

    final class TokenRoute: Route<AccessTokenResponse> {

        static func getToken(for id: String) -> Route<AccessTokenResponse> {
            .init(endpoint: "/user/\(id)")
        }
    }
}
