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
        text: String?,
        color: ColorPalette,
        fontSize: CGFloat = 15
    ) {
        super.init(frame: .zero)
        self.text = text
        textColor = color.colorValue()
        font = UIFont(name: "HelveticaNeue", size: fontSize)
    }
}
