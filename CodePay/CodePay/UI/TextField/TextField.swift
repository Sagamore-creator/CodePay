//  Created by Lech Lipnicki on 2021-05-06.
//

import UIKit

class TextField: UITextField {

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    init(placeholder: String?) {
        super.init(frame: .zero)
        initialize()
        updateAppearance()
        self.placeholder = placeholder
    }

    private func initialize() {
        delegate = self
        autocorrectionType = .no
        clearButtonMode = .never
        rightView = clearButton
        rightViewMode = .whileEditing
    }

    // MARK: - Appearance

    func updateAppearance() {
        borderStyle = .roundedRect
        backgroundColor = color(.lightGray)
        layer.cornerRadius = CornerRadiusSize.round.value
        layer.borderWidth = BorderWidth
        layer.borderColor = color(.brightGray)?.cgColor
        textAlignment = .center
        textColor = color(.darkGray)
        font = UIFont(name: "HelveticaNeue-Bold", size: 20)
    }

    // MARK: - Clear Button

    private lazy var clearButton: UIButton = {
        textFieldButton(
            with: UIImage(systemName: "clear.fill"),
            action: #selector(clear),
            tintColor: .gray
        )
    }()

    @objc private func clear() {
            self.text = ""
    }
}

// MARK: - TextField Button

extension TextField {

    func textFieldButton(
        with image: UIImage?,
        action: Selector,
        tintColor: UIColor
    ) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        button.contentMode = .scaleAspectFill
        button.tintColor = tintColor
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rightViewRect = super.rightViewRect(forBounds: bounds)
        rightViewRect.origin.x -= 10
        return rightViewRect
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var leftViewRect = super.leftViewRect(forBounds: bounds)
        leftViewRect.origin.x += 10
        return leftViewRect
    }
}

// MARK: - UITextFieldDelegate

extension TextField: UITextFieldDelegate {}
