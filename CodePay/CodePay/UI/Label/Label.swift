//  Created by Lech Lipnicki on 2021-05-10.
//

import UIKit

class Label: UILabel {

    // MARK: - Initializers

    init(
        text: String? = nil,
        color: ColorPalette,
        font: Font
    ) {
        super.init(frame: .zero)
        self.text = text
        textColor = color.colorValue()
        self.font = font.value
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
