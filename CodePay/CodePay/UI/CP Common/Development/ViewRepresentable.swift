//  Created by Lech Lipnicki on 2021-05-09.
//

import UIKit
import SwiftUI

struct ViewRepresentable: UIViewRepresentable {
    var view: () -> UIView

    func makeUIView(context: Context) -> some UIView {
        return view()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
