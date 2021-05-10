//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

public enum ColorPalette: Int {
    case greenBrand
    case grayDark
    case brightGray
    case lightGray
    case redPomegranate
    case bluePay
    case black
    case white
    case clear

    func colorValue(alpha: CGFloat = 1.0) -> UIColor? {
        switch self {
        case .greenBrand:
            return UIColor(hexString: "158443")
        case .grayDark:
            return UIColor(hexString: "3B4048")
        case .brightGray:
            return UIColor(hexString: "E1E5EA")
        case .lightGray:
            return UIColor(hexString: "F6F6F6")
        case .redPomegranate:
            return UIColor(hexString: "CF3B2B")
        case .bluePay:
            return UIColor(hexString: "8AB6D6")
        case .black:
            return .black
        case .white:
            return .white
        case .clear:
            return .clear
        }
    }
}

public func color(_ colorPalette: ColorPalette, alpha: CGFloat = 1.0) -> UIColor? {
    colorPalette.colorValue(alpha: alpha)
}
