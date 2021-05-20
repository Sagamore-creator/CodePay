//  Created by Lech Lipnicki on 2021-05-12.
//

import Foundation

struct UserDefaultsManager {

    private enum UserDefaultsManagerKey {
        static let userId: String = "CurrentUserId"
        static let tokenExpiration: String = "CurrentTokenExpiration"
        static let loggedInUser: String = "LoggedInUser"
    }

    private let userDefaults: UserDefaults = .standard
}

// MARK: - User handling functionality

extension UserDefaultsManager {

    // MARK: User

    func getUserId() -> Int? {
        return userDefaults.object(forKey: UserDefaultsManagerKey.userId) as? Int
    }

    func saveUserId(id: Int) {
        userDefaults.setValue(id, forKey: UserDefaultsManagerKey.userId)
    }

    // MARK: Token

    func getTokenExpiration() -> Int? {
        return userDefaults.object(forKey: UserDefaultsManagerKey.tokenExpiration) as? Int
    }

    func saveTokenExpiration(_ expiration: Int) {
        userDefaults.setValue(expiration, forKey: UserDefaultsManagerKey.tokenExpiration)
    }

    func isUserLoggedIn() -> Bool {
        guard let expirationTimestamp = getTokenExpiration() else {
            return false
        }

        let currentTimestamp = Date().timeIntervalSince1970

        return expirationTimestamp > Int(currentTimestamp)
    }

    // MARK: LoggedInUser

    func saveLoggedInUser(_ user: User?) {
        let encodedLoggedInUser = try? JSONEncoder().encode(user)
        userDefaults.set(encodedLoggedInUser, forKey: UserDefaultsManagerKey.loggedInUser)
    }

    func getLoggedInUser() -> User? {
        let loggedInUser = UserDefaultsManagerKey.loggedInUser

        guard let encodedLoggedInUser = userDefaults.object(forKey: loggedInUser) as? Data else {
            return nil
        }
        return try? JSONDecoder().decode(User.self, from: encodedLoggedInUser)
    }

    func removeLoggedInUser() {
        let loggedInUser = UserDefaultsManagerKey.loggedInUser
        userDefaults.removeObject(forKey: loggedInUser)
    }
}
