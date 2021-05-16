//  Created by Lech Lipnicki on 2021-05-16.
//

import UIKit

enum Font: Int {
    case title
    case body
    case subtitle

    func value() -> UIFont? {
        switch self {
        case .title:
            return UIFont(name: "HelveticaNeue-Bold", size: size)
        case .body:
            return UIFont(name: "HelveticaNeue", size: size)
        case .subtitle:
            return UIFont(name: "HelveticaNeue", size: size)
        }
    }

    private var size: CGFloat {
        switch self {
        case .title:
            return 20
        case .body:
            return 15
        case .subtitle:
            return 10
        }
    }
}

func font(_ font: Font) -> UIFont? {
    font.value()
}
