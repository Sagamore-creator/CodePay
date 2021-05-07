//  Created by Lech Lipnicki on 2021-05-07.
//

import UIKit

extension UIView {
    
    func fadeIn() {
        UIView.animate(
            withDuration: 0.8,
            delay: 0.0,
            options: UIView.AnimationOptions.curveEaseIn,
            animations: { [weak self] in
            self?.alpha = 1.0
            },
            completion: nil
        )
    }

    func fadeOut() {
        UIView.animate(
            withDuration: 0.7,
            delay: 0.0,
            options: UIView.AnimationOptions.curveEaseOut,
            animations: { [weak self] in
            self?.alpha = 0.5
            },
            completion: nil
        )
    }
}
