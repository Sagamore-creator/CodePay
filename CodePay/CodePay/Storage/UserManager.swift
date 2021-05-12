//  Created by Lech Lipnicki on 2021-05-12.
//

import Foundation

struct UserManager {

    private enum UserManagerKey {
        static let userId: String = "current user id"
        static let tokenExpiration: String = "current token expiration"
    }

    private let userDefaults: UserDefaults = .standard
}

// MARK: - User handling functionality

extension UserManager {

    // MARK: User

    func getUserId() -> Int? {
        return userDefaults.object(forKey: UserManagerKey.userId) as? Int
    }

    func saveUserId(id: Int) {
        userDefaults.setValue(id, forKey: UserManagerKey.userId)
    }

    // MARK: Token

    func getTokenExpiration() -> Int? {
        return userDefaults.object(forKey: UserManagerKey.tokenExpiration) as? Int
    }

    func saveTokenExpiration(_ expiration: Int) {
        userDefaults.setValue(expiration, forKey: UserManagerKey.tokenExpiration)
    }

    func isUserLoggedIn() -> Bool {
        guard let expirationTimestamp = getTokenExpiration() else {
            return false
        }

        let currentTimestamp = Date().timeIntervalSince1970

        return expirationTimestamp > Int(currentTimestamp)
    }
}
