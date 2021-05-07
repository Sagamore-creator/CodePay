//  Created by Lech Lipnicki on 2021-05-06.
//

import UIKit

final class UIComponentBuilder {

    // MARK: - Text Fields

    static func phoneNumberTextField() -> UITextField {
        UITextField()
    }

    static func passwordTextField() -> UITextField {
        UITextField()
    }

    // MARK: - Buttons

    static func button(
        title: String,
        style: ButtonStyle,
        onTap: @escaping () -> ()
    ) -> Button {
        Button(
            title: title,
            onTap: onTap
        )
    }
}
