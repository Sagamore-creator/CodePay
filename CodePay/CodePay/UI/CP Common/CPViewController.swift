//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

class CPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }

    func setupView(with views: [UIView] = []) {
        view.backgroundColor = .white
        addSubViews(views)
    }

    func setupConstraints() {}
}

// MARK: - CPViewController Helpers

extension CPViewController {

    func addSubViews(_ subViews: [UIView]) {
        for subView in subViews {
            view.addSubview(subView)
        }
    }

    // MARK: UIControl targets

    func addTargets(
        for UIControls: [UIControl],
        with action: Selector,
        for event: UIControl.Event
    ) {
        for UIControl in UIControls {
            UIControl.addTarget(self, action: action, for: event)
        }
    }

    func removeTargets(from UIControls: [UIControl], for event: UIControl.Event) {
        for UIControl in UIControls {
            UIControl.removeTarget(nil, action: nil, for: event)
        }
    }
}
