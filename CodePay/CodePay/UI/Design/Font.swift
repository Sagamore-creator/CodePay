//  Created by Lech Lipnicki on 2021-05-16.
//

import UIKit

enum Font: Int {
    case title
    case body
    case subtitle

    var value: UIFont? {
        switch self {
        case .title:
            return UIFont(name: "HelveticaNeue-Bold", size: 20)
        case .body:
            return UIFont(name: "HelveticaNeue", size: 15)
        case .subtitle:
            return UIFont(name: "HelveticaNeue", size: 10)
        }
    }
}

func font(_ font: Font) -> UIFont? {
    font.value
}
