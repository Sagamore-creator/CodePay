//  Created by Lech Lipnicki on 2021-05-15.
//

import Foundation

final class UserManager {
    private static let api = API.self
    private static let userDefaults = UserDefaultsManager()
    private static var loggedInUser = userDefaults.getLoggedInUser()
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
            throw Error.unknownError
        }
        
        try validateRegistrationFields(
            phoneNumber: phoneNumber,
            password: password,
            confirmPassword: confirmPassword,
            currency: currency
        )

        let user = User(
            id: nil,
            phoneNumber: phoneNumber,
            password: password
        )

        api.registerUser(user) {
            loggedInUser = user

            userDefaults.saveLoggedInUser(
                User(
                    id: user.id,
                    phoneNumber: user.phoneNumber,
                    password: ""
                )
            )
        }

        api.registerAccount(
            Account(
                id: user.id,
                phoneNumber: user.phoneNumber,
                currency: currency,
                balance: 0
            )
        )
    }

    static func loginUser(phoneNumber: String?, password: String?) throws {
        guard let phoneNumber = phoneNumber, let password = password else {
            throw Error.unknownError
        }

        try validateLogin(
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

// MARK: - Validation methods

private extension UserManager {

    static func validateRegistrationFields(
        phoneNumber: String,
        password: String,
        confirmPassword: String,
        currency: String
    ) throws {
        try checkIfCredentialsNotEmpty(
            phoneNumber: phoneNumber,
            password: password,
            confirmPassword: confirmPassword,
            currency: currency
        )
        try checkPhoneNumber(phoneNumber)
        try checkPassword(password)
        try checkPasswordMatching(for: password, confirmPassword)
        try checkIfUserExists()
    }

    static func validateLogin(phoneNumber: String, password: String) throws {
        try checkIfFieldsNotEmpty(phoneNumber: phoneNumber, password: password)
        try checkPhoneNumber(phoneNumber)
        try checkPassword(password)
        try checkIfUserValid(with: password)
    }

    // MARK: Validations

    static func checkPhoneNumber(_ number: String) throws {
        let numberRegex = "^\\w{11,}$"
        let trimmedString = number.trimmingCharacters(in: .whitespaces)
        let validatePhone = NSPredicate(format: "SELF MATCHES %@", numberRegex)
        let isValidPhone = validatePhone.evaluate(with: trimmedString)

        guard isValidPhone else {
            throw Error.wrongPhoneNumberSyntax
        }
    }

    static func checkPassword(_ password: String) throws {
        let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$" // min 8 chars, 1 letter, 1 number
        let trimmedString = password.trimmingCharacters(in: .whitespaces)
        let validatePassword = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        let isValidPassword = validatePassword.evaluate(with: trimmedString)

        guard isValidPassword else {
            throw Error.wrongPasswordSyntax
        }
    }

    static func checkPasswordMatching(for password: String, _ confirmPassword: String) throws {
        guard password == confirmPassword else {
            throw Error.passwordsDontMatch
        }
    }

    static func checkIfCredentialsNotEmpty(
        phoneNumber: String,
        password: String,
        confirmPassword: String,
        currency: String
    ) throws {
        guard
            phoneNumber.isNotEmpty &&
                password.isNotEmpty &&
                confirmPassword.isNotEmpty &&
                currency.isNotEmpty
        else {
            throw Error.missingValues
        }
    }

    static func checkIfFieldsNotEmpty(phoneNumber: String, password: String) throws {
        guard phoneNumber.isNotEmpty && password.isNotEmpty else {
            throw Error.missingValues
        }
    }

    static func checkIfUserValid(with password: String) throws {
        guard let user = UserManager.user, user.password == password else {
            throw Error.wrongPassword
        }
    }

    static func checkIfUserExists() throws {
        guard UserManager.user == nil else {
            throw Error.userAlreadyExists
        }
    }
}

// MARK: - User Errors

extension UserManager {

    enum Error: Swift.Error {
        case missingValues
        case userAlreadyExists
        case wrongPhoneNumberSyntax
        case wrongPassword
        case wrongPasswordSyntax
        case passwordsDontMatch
        case userNotFound
        case unknownError

        var description: String {
            switch self {
            case .missingValues:
                return "Missing required values."
            case .userAlreadyExists:
                return "This user is already taken."
            case .wrongPhoneNumberSyntax:
                return "Number format should be +370 000 00 000."
            case .wrongPassword:
                return "Incorrect password!"
            case .wrongPasswordSyntax:
                return "Password must have min 8 symbols, 1 letter, 1 number."
            case .passwordsDontMatch:
                return "Passwords doesn't match"
            case .userNotFound:
                return "Wrong Phone Number or password."
            case .unknownError:
                return "Unknown Error occurred!"
            }
        }
    }
}
