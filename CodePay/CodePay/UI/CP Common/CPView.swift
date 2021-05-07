//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

class CPView: UIView {
    init() {
        super.init(frame: .zero)

        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupView()
        setupConstraints()
    }

    func setupView() {}
    func setupConstraints() {}
}
