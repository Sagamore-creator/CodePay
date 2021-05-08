//  Created by Lech Lipnicki on 2021-05-06.
//

import UIKit

class TextField: UITextField {

    // MARK: - Initialize

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

        borderStyle = .roundedRect
        backgroundColor = color(.lightGray)
        layer.cornerRadius = CornerRadiusSize.round.value
        textAlignment = .center
        textColor = color(.darkGray)
        font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        self.placeholder = placeholder
    }

    private func initialize() {
        autocorrectionType = .no
    }
}
