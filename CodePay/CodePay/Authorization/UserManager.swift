//  Created by Lech Lipnicki on 2021-05-15.
//

import Foundation

final class UserManager {
    private static let api = API.self
    private static let validate = Validate.self
    private static let userDefaults = UserDefaultsManager()
    private static var loggedInUser: User? = userDefaults.getLoggedInUser()
    static var user: User?

    // MARK: - Register / Login / Check User

    static func registerUserAndAccount(
        phoneNumber: String?,
        password: String?,
        confirmPassword: String?,
        currency: String?
    ) throws {
        guard
            let phoneNumber = phoneNumber,
            let password = password,
            let confirmPassword = confirmPassword,
            let currency = currency
        else {
            throw ErrorMessage.unknownError
        }
        
        try validate.registrationFields(
            phoneNumber: phoneNumber,
            password: password,
            confirmPassword: confirmPassword,
            currency: currency
        )

        let user: User = User(
            id: nil,
            phoneNumber: phoneNumber,
            password: password
        )

        api.registerUser(user)
        loggedInUser = user

        userDefaults.saveLoggedInUser(
            User(
                id: user.id,
                phoneNumber: user.phoneNumber,
                password: ""
            )
        )

        api.registerAccount(
            Account(
                id: nil,
                phoneNumber: phoneNumber,
                currency: currency,
                balance: 0
            )
        )
    }

    static func loginUser(phoneNumber: String?, password: String?) throws {
        guard let phoneNumber = phoneNumber, let password = password else {
            throw ErrorMessage.unknownError
        }
        try validate.login(
            phoneNumber: phoneNumber,
            password: password
        )
        loggedInUser = user

        userDefaults.saveLoggedInUser(
            User(
                id: user?.id,
                phoneNumber: user?.phoneNumber ?? "",
                password: ""
            )
        )

        user = nil
    }
}
