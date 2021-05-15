//  Created by Lech Lipnicki on 2021-05-09.
//

import UIKit

class PhoneNumberTextField: TextField {
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    override init(placeholder: String?) {
        super.init(frame: .zero)
        initialize()
        updateAppearance()
        self.placeholder = placeholder
    }

    private func initialize() {
        keyboardType = .numberPad
    }

    override func updateAppearance() {
        super.updateAppearance()
    }
}

// MARK: - UITextFieldDelegate methods

extension PhoneNumberTextField {

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return (string.rangeOfCharacter(from: invalidCharacters) == nil)
    }
}
