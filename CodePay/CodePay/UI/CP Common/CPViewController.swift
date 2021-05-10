//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit

class CPViewController: UIViewController {

    deinit {
        print("CPViewController DEINITED")
    }

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

    // MARK: Navigation

    enum PresentationStyle {
        case modalFull
        case modal
        case push
    }

    func present(
        viewController: UIViewController,
        style: PresentationStyle,
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        switch style {
        case .modalFull:
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: animated, completion: completion)
        case .modal:
            let navigationController = UINavigationController(rootViewController: viewController)
            present(navigationController, animated: animated, completion: completion)
        case .push:
            navigationController?.pushViewController(viewController, animated: animated)
        }
    }

    // MARK: Views

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
