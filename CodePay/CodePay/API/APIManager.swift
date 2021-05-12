//  Created by Lech Lipnicki on 2021-05-12.
//

import Foundation

struct APIManager {
    private let userManager = UserManager()

    let method: Method?
    let baseURL: String?
    let endpoint: String?
    let params: Encodable?
    let session: URLSession?

    private var userId: Int? {
        userManager.getUserId()
    }
}

// MARK: - APIError

extension APIManager {

    enum APIError: Error {
        case invalidEndpoint(String)
        case badResponse(URLResponse?)
    }
}

// MARK: - HTTPMethod

extension APIManager {

    enum Method: String {
        case get
        case post
        case put
        case delete
    }
}
