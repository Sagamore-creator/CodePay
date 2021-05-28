//  Created by Lech Lipnicki on 2021-05-09.
//

import UIKit

class PhoneNumberTextField: TextField {
    var phoneNumber: String? = ""
    
    // MARK: - Initialize

    override func initialize() {
        super.initialize()
        keyboardType = .numbersAndPunctuation
    }
}

// MARK: - UITextFieldDelegate methods

extension PhoneNumberTextField {

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        guard let text = textField.text else { return false }
        let newText = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "+XXX XXX XX XXX", phoneNumber: newText)
        phoneNumber = format(with: "XXXXXXXXXXX", phoneNumber: newText)
        return false
    }

    // MARK: Format Phone Number

    private func format(with mask: String, phoneNumber: String) -> String {
        let numbers = phoneNumber.replacingOccurrences(
            of: "[^0-9]",
            with: "",
            options: .regularExpression
        )

        var result = ""
        var index = numbers.startIndex

        for character in mask where index < numbers.endIndex {
            if character == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(character)
            }
        }
        return result
    }
}
