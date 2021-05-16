//  Created by Lech Lipnicki on 2021-05-10.
//

import UIKit

class Label: UILabel {

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(
        text: String? = nil,
        color: ColorPalette,
        font: Font
    ) {
        super.init(frame: .zero)
        self.text = text
        textColor = color.colorValue()
        self.font = font.value()
    }
}
