//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

enum Icon: Int {
    case logo
    case add
    case clear
    case delete
    case passwordShow
    case passwordHide

    var image: UIImage? {
        switch self {
        case .logo:
            return UIImage(named: "Logo")
        case .add:
            return UIImage(systemName: "plus.square.fill")
        case .clear:
            return UIImage(systemName: "xmark.circle.fill")
        case .delete:
            return UIImage(systemName: "trash.fill")
        case .passwordShow:
            return UIImage(systemName: "eye.fill")
        case .passwordHide:
            return UIImage(systemName: "eye.slash.fill")
        }
    }
}
