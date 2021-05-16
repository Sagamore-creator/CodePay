//  Created by Lech Lipnicki on 2021-05-15.
//

import Foundation

extension UserManager {

    enum ErrorMessage: Error {
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
                return "Number length must be 9-11 characters."
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
