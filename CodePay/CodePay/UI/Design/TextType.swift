//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

enum TextType: Int {
    case body
    case heading
    case title
    case subtitle
    case caption
    case label
    case userInput

    var fontSize: CGFloat {
        switch self {
        case .body:
            return 4.units
        case .heading:
            return 6.units
        case .title:
            return 4.units
        case .subtitle:
            return 3.5.units
        case .caption:
            return 3.units
        case .label:
            return 3.5.units
        case .userInput:
            return 4.units
        }
    }

    var lineHeight: CGFloat {
        switch self {
        case .body:
            return 5.5.units
        case .heading:
            return 8.units
        case .title:
            return 5.5.units
        case .subtitle:
            return 4.5.units
        case .caption:
            return 4.units
        case .label:
            return 4.5.units
        case .userInput:
            return 5.5.units
        }
    }

    var color: ColorPalette {
        switch self {
        case .body:
            return .darkGray
        case .heading, .title, .userInput:
            return .darkGray
        case .caption, .subtitle, .label:
            return .darkGray
        }
    }

//    var font: UIFont {
//        switch self {
//        case .body, .subtitle, .caption, .label, .userInput:
//            return FontRegular(fontSize)
//        case .heading, .title:
//            return FontMedium(fontSize)
//        }
//    }
//
//    var lineSpacePadding: CGFloat {
//        return (lineHeight - font.lineHeight) / 2
//    }
}
