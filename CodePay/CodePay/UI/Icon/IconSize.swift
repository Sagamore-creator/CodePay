//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

enum IconSize: Int {
    case xSmall
    case small
    case regular
    case medium
    case large
    case xLarge
    case xxLarge
    case xxxLarge
    case xxxxLarge

    public var size: CGSize {
        switch self {
        case .xSmall:
            return CGSize(width: 3.units, height: 3.units)
        case .small:
            return CGSize(width: 4.units, height: 4.units)
        case .regular:
            return CGSize(width: 6.units, height: 6.units)
        case .medium:
            return CGSize(width: 8.units, height: 8.units)
        case .large:
            return CGSize(width: 12.units, height: 12.units)
        case .xLarge:
            return CGSize(width: 16.units, height: 16.units)
        case .xxLarge:
            return CGSize(width: 24.units, height: 24.units)
        case .xxxLarge:
            return CGSize(width: 32.units, height: 32.units)
        case .xxxxLarge:
            return CGSize(width: 48.units, height: 48.units)
        }
    }
}
