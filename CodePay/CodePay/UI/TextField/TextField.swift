//  Created by Lech Lipnicki on 2021-05-06.
//

import UIKit

class TextField: UITextField {

    // MARK: - Initializers

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(placeholder: String?) {
        super.init(frame: .zero)
        initialize()
        updateAppearance()
        self.placeholder = placeholder
    }

    func initialize() {
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
        layer.borderColor = color(.grayDark)?.cgColor
        textAlignment = .center
        textColor = color(.grayDark)
        font = Font.title.value
    }

    // MARK: - Clear Button

    private lazy var clearButton: UIButton = {
        textFieldButton(
            with: Icon.clear.image,
            action: #selector(clear),
            tintColor: .gray
        )
    }()

    @objc private func clear() {
        text = ""
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
        button.setBackgroundImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = tintColor
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rightViewRect = super.rightViewRect(forBounds: bounds)
        rightViewRect.origin.x -= 10
        rightViewRect.size = CGSize(width: 20, height: 20)
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
