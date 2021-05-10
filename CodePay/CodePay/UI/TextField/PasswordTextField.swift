//  Created by Lech Lipnicki on 2021-05-09.
//

import UIKit

class PasswordTextField: TextField {

    // MARK: - Initialize

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
        isSecureTextEntry = true
        leftView = showInput
        leftViewMode = .whileEditing
    }

    override func updateAppearance() {
        super.updateAppearance()
    }

    // MARK: - Password Show/Hide Input Button

    private lazy var showInput: UIButton = {
        textFieldButton(
            with: image,
            action: #selector(show),
            tintColor: .gray
        )
    }()

    @objc private func show() {
        if isSecureTextEntry == true {
            isSecureTextEntry = false
            changeButtonImage(with: image)
        } else {
            isSecureTextEntry = true
            changeButtonImage(with: image)
        }
    }

    private var image: UIImage? {
        if isSecureTextEntry == true {
            return Icon.passwordShow.image
        } else {
            return Icon.passwordHide.image
        }
    }

    private func changeButtonImage(with image: UIImage?) {
        showInput.setImage(image, for: .normal)
    }
}

// MARK: - UITextFieldDelegate methods

extension PasswordTextField {

    override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
            }
        }
    }

    override func becomeFirstResponder() -> Bool {
        let success = super.becomeFirstResponder()
        if let existingText = text, isSecureTextEntry {
            deleteBackward()
            if let textRange = textRange(from: beginningOfDocument, to: endOfDocument) {
                replace(textRange, withText: existingText)
            }
        }
        if let existingTextRange = selectedTextRange {
            selectedTextRange = nil
            selectedTextRange = existingTextRange
        }
        return success
    }
}
