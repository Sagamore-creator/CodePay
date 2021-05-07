//  Created by Lech Lipnicki on 2021-05-06.
//

import UIKit

typealias ButtonTap = () -> Void

class Button: UIButton {
    private var onTap: ButtonTap?

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    init(
        title: String?,
        titleColor: ColorPalette? = .white,
        backgroundColor: ColorPalette? = .brightGray,
        border: BorderSize? = BorderSize.none,
        borderColor: ColorPalette? = .clear,
        isEnabled: Bool? = true,
        onTap: ButtonTap?
    ) {
        super.init(frame: .zero)
        initialize()

        if let title = title,
           let titleColor = titleColor,
           let backgroundColor = backgroundColor,
           let border = border,
           let borderColor = borderColor,
           let isEnabled = isEnabled {
            setTitle(title, for: .normal)
            setTitleColor(color(titleColor), for: .normal)
            self.backgroundColor = color(backgroundColor)
            layer.borderColor = color(borderColor)?.cgColor
            self.isEnabled = isEnabled
            layer.borderWidth = border.value
            addAction(for: .touchUpInside, onTap!)
        }
    }

    private func initialize() {
        showsTouchWhenHighlighted = false
        layer.cornerRadius = ButtonRoundedRadius
        layer.masksToBounds = true
        layer.borderWidth = BorderWidth
        addTarget(self, action: #selector(tap), for: .touchDown)
        addTarget(self, action: #selector(tapEnd), for: .touchUpInside)
        addTarget(self, action: #selector(tapCancel), for: .touchCancel)
        addTarget(self, action: #selector(tapCancel), for: .touchUpOutside)
    }

    // MARK: - Actions

    @objc func tap() {
        fadeOut()
    }

    @objc func tapEnd() {
        fadeIn()
    }

    @objc func tapCancel() {
        fadeIn()
    }
}

// MARK: - Button Helpers

extension Button {

    func disableButton() {
        self.backgroundColor = color(.lightGray)
        self.isEnabled = false
    }

    func enableButton() {
        self.backgroundColor = color(.darkGray)
        self.isEnabled = true
    }
}

extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping()->()) {
        addAction(UIAction { (action: UIAction) in closure() }, for: controlEvents)
    }
}
