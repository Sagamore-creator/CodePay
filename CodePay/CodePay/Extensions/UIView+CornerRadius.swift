//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

enum CornerRadius: CGFloat {
    case rounded = 10
    case right = 1.0
}

extension UIView {

    func roundCorners(
        _ corners: UIRectCorner,
        cornerRadius: CornerRadius = .rounded
    ) {
        let path = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: cornerRadius.rawValue, height: cornerRadius.rawValue)
        )

        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
