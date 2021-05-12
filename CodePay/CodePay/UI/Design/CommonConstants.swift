//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

let BorderWidth: CGFloat = 1.0
let AlphaEnabled: CGFloat = 1.0
let AlphaDisabled: CGFloat = 0.5
let ButtonRoundedRadius = CornerRadiusSize.default.valueFrom(size: .zero)

// MARK: - Currency TEMPORARY

var currency: [Currency] = [
    Currency(title: "USD"),
    Currency(title: "EUR"),
    Currency(title: "LT"),
    Currency(title: "ZL"),
    Currency(title: "NOK")
]

// MARK: - Units

private let UnitBase: CGFloat = 4

extension Int {
    public var units: CGFloat {
        return CGFloat(self) * UnitBase
    }
}

extension CGFloat {
    public var units: CGFloat {
        return self * UnitBase
    }
}

extension Double {
    public var units: CGFloat {
        return CGFloat(self) * UnitBase
    }
}

// MARK: - Border Size

enum BorderSize: Int {
    case none
    case `default`

    var value: CGFloat {
        switch self {
        case .none:
            return 0.units
        case .default:
            return BorderWidth
        }
    }
}

// MARK: - Radius Size

enum CornerRadiusSize: Int {
    case none
    case `default`
    case round

    var value: CGFloat {
        switch self {
        case .none:
            return 0.units
        case .default:
            return 1.units
        case .round:
            return 8
        }
    }

    func valueFrom(size: CGSize) -> CGFloat {
        switch self {
        case .none:
            return 0.units
        case .default:
            return 1.units
        case .round:
            return min(size.width, size.height) / 2
        }
    }
}

func RoundRadiusSize(size: CGSize) -> CGFloat {
    return min(size.width, size.height) / 2
}
