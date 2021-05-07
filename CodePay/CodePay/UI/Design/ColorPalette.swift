//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

public enum ColorPalette: Int {
    case greenBrand
    case brightGray
    case darkGray
    case lightGray
    case redPomegranate
    case backgroundMain
    case black
    case white
    case clear

    func colorValue(alpha: CGFloat = 1.0) -> UIColor? {
        switch self {
        case .greenBrand:
            return UIColor(hexString: "158443")
        case .brightGray:
            return UIColor(hexString: "3B4048")
        case .darkGray:
            return UIColor(hexString: "555555")
        case .lightGray:
            return UIColor(hexString: "F6F6F6")
        case .redPomegranate:
            return UIColor(hexString: "CF3B2B")
        case .backgroundMain:
            return UIColor(hexString: "535454")
        case .black:
            return .black
        case .white:
            return .white
        case .clear:
            return .clear
        }
    }
}

public func color(_ colorPalette: ColorPalette) -> UIColor? {
    colorPalette.colorValue()
}
