//  Created by Lech Lipnicki on 2021-05-09.
//

import UIKit
import SwiftUI

struct ViewControllerRepresentable<T: UIViewController>: UIViewControllerRepresentable {
    var viewController: () -> T

    func makeUIViewController(context: Context) -> T {
        return viewController()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
