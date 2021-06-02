//  Created by Lech Lipnicki on 2021-05-06.
//

import UIKit

enum ButtonStyle: Int {
    case `default`
    case filled
    case hollow
}

class Button: UIButton {
    typealias ButtonTap = () -> Void

    // MARK: - Initializers

    init(
        title: String?,
        style: ButtonStyle? = .default,
        isEnabled: Bool? = true,
        onTap: ButtonTap?
    ) {
        super.init(frame: .zero)
        initialize()
        updateAppearance(title: title, style: style)
        performAction(onTap)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialize() {
        showsTouchWhenHighlighted = false
        layer.masksToBounds = true
        addTarget(self, action: #selector(tap), for: .touchDown)
        addTarget(self, action: #selector(tapEnd), for: .touchUpInside)
        addTarget(self, action: #selector(tapCancel), for: .touchCancel)
        addTarget(self, action: #selector(tapCancel), for: .touchUpOutside)
    }

    // MARK: - Appearance

    func setupButtonAppearance(
        titleColor: ColorPalette,
        backgroundColor: ColorPalette,
        border: BorderSize,
        borderColor: ColorPalette,
        cornerRadius: CornerRadiusSize
    ) {
        setTitleColor(color(titleColor), for: .normal)
        titleLabel?.font = Font.title.value
        self.backgroundColor = color(backgroundColor)
        layer.borderColor = color(borderColor)?.cgColor
        layer.borderWidth = border.value
        layer.cornerRadius = cornerRadius.value
    }

    private func updateAppearance(title: String?, style: ButtonStyle?) {
        switch style {
        case .default:
            defaultButton()
        case .filled:
            filledButton()
        case .hollow:
            hollowButton()
        case .none:
            return
        }
        setTitle(title, for: .normal)
    }

    private func defaultButton() {
        setupButtonAppearance(
            titleColor: .grayDark,
            backgroundColor: .lightGray,
            border: .default,
            borderColor: .grayDark,
            cornerRadius: .round
        )
    }

    private func filledButton() {
        setupButtonAppearance(
            titleColor: .lightGray,
            backgroundColor: .grayDark,
            border: .none,
            borderColor: .clear,
            cornerRadius: .round
        )
    }

    private func hollowButton() {
        setupButtonAppearance(
            titleColor: .grayDark,
            backgroundColor: .clear,
            border: .default,
            borderColor: .grayDark,
            cornerRadius: .round
        )
    }

    // MARK: - Actions

    private func performAction(_ onTap: ButtonTap?) {
        guard let onTap = onTap else { return }
        addAction(for: .touchUpInside, onTap)
    }

    @objc private func tap() {
        fadeOut()
    }

    @objc private func tapEnd() {
        fadeIn()
    }

    @objc private func tapCancel() {
        fadeIn()
    }
}

// MARK: - Button Helpers

extension Button {

    func disable() {
        isEnabled = false
    }

    func enable() {
        isEnabled = true
    }
}

extension UIControl {

    func addAction(
        for controlEvents: UIControl.Event = .touchUpInside,
        _ closure: @escaping () -> ()
    ) {
        addAction(UIAction { (action: UIAction) in closure() }, for: controlEvents)
    }
}
