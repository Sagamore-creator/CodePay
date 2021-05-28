//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

protocol ReusableView {
    static var reuseID: String { get }
}

extension ReusableView where Self: AnyObject {
    static var reuseID: String {
        return String(describing: self)
    }
}
