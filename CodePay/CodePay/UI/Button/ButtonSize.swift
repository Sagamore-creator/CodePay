//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

enum ButtonSize: Int {
    case `default`
    case medium
    case small

    var buttonHeight: CGFloat {
        switch self {
        case .default:
            return 11.units
        case .medium:
            return 9.units
        case .small:
            return 7.units
        }
    }

    var icon: IconSize {
        switch self {
        case .default:
            return .regular
        case .medium:
            return .small
        case .small:
            return .xSmall
        }
    }

    var spacingBetweenImageAndTitle: CGFloat {
        switch self {
        case .default:
            return 1.5.units
        case .medium:
            return 1.units
        case .small:
            return 0.5.units
        }
    }

    var contentInsets: UIEdgeInsets {
        switch self {
        case .default:
            return UIEdgeInsets(top: 0.units, left: 3.5.units, bottom: 0.units, right: 3.5.units)
        case .medium:
            return UIEdgeInsets(top: 0.units, left: 2.75.units, bottom: 0.units, right: 2.75.units)
        case .small:
            return UIEdgeInsets(top: 0.units, left: 2.units, bottom: 0.units, right: 2.units)
        }
    }

    fileprivate var textType: TextType {
        switch self {
        case .default:
            return .title
        case .medium:
            return .subtitle
        case .small:
            return .caption
        }
    }

    fileprivate var contentInsetsForOnlyImage: UIEdgeInsets {
        return UIEdgeInsets(
            top: 0,
            left: (buttonHeight - icon.size.height) / 2,
            bottom: 0,
            right: (buttonHeight - icon.size.height) / 2
        )
    }
}
