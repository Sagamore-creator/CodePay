//  Created by Lech Lipnicki on 2021-05-15.
//

import Foundation

extension UserManager {

    final class Validate {

        static func registrationFields(
            phoneNumber: String,
            password: String,
            confirmPassword: String,
            currency: String
        ) throws {
            guard checkIfCredentialsNotEmpty(
                phoneNumber: phoneNumber,
                password: password,
                confirmPassword: confirmPassword,
                currency: currency
            ) else {
                throw ErrorMessage.missingValues
            }

            guard checkPhoneNumber(phoneNumber) else {
                throw ErrorMessage.wrongPhoneNumberSyntax
            }

            guard checkPasswordSyntax(password: password) else {
                throw ErrorMessage.wrongPasswordSyntax
            }

            guard checkPasswordMatching(password: password, confirmPassword: confirmPassword) else {
                throw ErrorMessage.passwordsDontMatch
            }

            guard !isUserExist() else {
                throw ErrorMessage.userAlreadyExists
            }
        }

        static func login(phoneNumber: String, password: String) throws {
            guard phoneNumber.isNotEmpty, password.isNotEmpty else {
                throw ErrorMessage.missingValues
            }

            guard checkPhoneNumber(phoneNumber) else {
                throw ErrorMessage.wrongPhoneNumberSyntax
            }

            guard checkPasswordSyntax(password: password) else {
                throw ErrorMessage.wrongPasswordSyntax
            }

            guard isUserValid(password: password) else {
                throw ErrorMessage.userNotFound
            }
        }


        // MARK: - Private methods

        private static func checkPhoneNumber(_ number: String) -> Bool {
            let numberRegex = "^\\w{11,}$"
            let trimmedString = number.trimmingCharacters(in: .whitespaces)
            let validatePhone = NSPredicate(format: "SELF MATCHES %@", numberRegex)
            let isValidPhone = validatePhone.evaluate(with: trimmedString)
            return isValidPhone
        }

        private static func checkPasswordSyntax(password: String) -> Bool {
            let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$" // min 8 chars, 1 letter, 1 number
            let trimmedString = password.trimmingCharacters(in: .whitespaces)
            let validatePassword = NSPredicate(format:"SELF MATCHES %@", passRegEx)
            let isValidPassword = validatePassword.evaluate(with: trimmedString)
            return isValidPassword
        }

        private static func checkPasswordMatching(password: String, confirmPassword: String) -> Bool {
            password == confirmPassword ? true : false
        }

        private static func checkIfCredentialsNotEmpty(
            phoneNumber: String,
            password: String,
            confirmPassword: String,
            currency: String
        ) -> Bool {
            phoneNumber.isNotEmpty &&
                password.isNotEmpty &&
                confirmPassword.isNotEmpty &&
                currency.isNotEmpty ? true : false
        }

        private static func isUserValid(password: String) -> Bool {
            guard let user = UserManager.user else {
                return false
            }
            return user.password == password ? true : false
        }

        private static func isUserExist() -> Bool {
            UserManager.user == nil ? false : true
        }
    }
}
