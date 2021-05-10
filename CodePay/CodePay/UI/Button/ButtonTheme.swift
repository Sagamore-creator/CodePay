//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

enum ButtonTheme: Int {
    case `default`
    case muted
    case success
    case warning
    case none

    var primaryColor: UIColor? {
        switch self {
        case .default:
            return color(.grayDark)
        case .muted:
            return color(.lightGray)
        case .success:
            return color(.greenBrand)
        case .warning:
            return color(.redPomegranate)
        case .none:
            return color(.clear)
        }
    }
}
