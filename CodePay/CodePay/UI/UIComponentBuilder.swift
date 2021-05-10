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

    static func passwordTextField() -> TextField {
        PasswordTextField(placeholder: "Password")
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

    // MARK: Custom Buttons
}
