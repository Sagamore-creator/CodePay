//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

extension UIView {

    func roundCorners(
        _ corners: UIRectCorner,
        cornerRadius: CornerRadiusSize = .round
    ) {
        let path = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: cornerRadius.value, height: cornerRadius.value)
        )

        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
