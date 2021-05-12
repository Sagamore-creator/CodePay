//  Created by Lech Lipnicki on 2021-05-06.
//

import UIKit

final class UIComponentBuilder {

    // MARK: - Text Field

    static func textField(placeholder: String?) -> TextField {
        TextField(placeholder: placeholder)
    }

    // MARK: Custom TextFields

    static func phoneNumberTextField() -> TextField {
        PhoneNumberTextField(placeholder: "Phone Number")
    }

    static func passwordTextField(placeholder: String? = "Password") -> TextField {
        PasswordTextField(placeholder: placeholder)
    }

    // MARK: - Button

    static func button(
        title: String,
        style: ButtonStyle,
        onTap: @escaping () -> ()
    ) -> Button {
        Button(
            title: title,
            style: style,
            onTap: onTap
        )
    }

    // MARK: - Selection View

    static func selectionView(
        title: String?,
        value: String?,
        onTap: @escaping () -> ()
    ) -> SelectionView {
        SelectionView(
            titleText: title,
            selectedValue: value,
            onTap: onTap
        )
    }
}
