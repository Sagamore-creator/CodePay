//  Created by Lech Lipnicki on 2021-05-12.
//

import Foundation

enum APIEndpoint {
    case checkAccessToken(userIdentifier: Int)

    var url: URL? {
        switch self {
        case .checkAccessToken(let userIdentifier):
            return makeURL(endpoint: .user, id: userIdentifier)
        }
    }
}

private extension APIEndpoint {

    var BaseURL: String {
        "https://608886a3a6f4a30017426912.mockapi.io/api/v5/"
    }

    func makeURL(
        endpoint: Endpoint,
        id: Int? = nil,
        queryItems: [URLQueryItem]? = nil
    ) -> URL? {
        let url = BaseURL + endpoint.value

        guard let id = id else { return
            URL(string: url)
        }

        let urlString = BaseURL + endpoint.value + "\(id)"

        guard let queryItems = queryItems else {
            return URL(string: urlString)
        }

        var components = URLComponents(string: urlString)
        components?.queryItems = queryItems
        return components?.url
    }
}

// MARK: - Endpoints

private extension APIEndpoint {

    enum Endpoint: Int {
        case user
        case account
        case transaction

        var value: String {
            switch self {
            case .user:
                return "user/"
            case .account:
                return "/account"
            case .transaction:
                return "/transaction"
            }
        }
    }
}
