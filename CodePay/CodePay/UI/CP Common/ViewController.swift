//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }

    func setupView(with views: [UIView] = []) {
        view.backgroundColor = .white
        addSubViews(for: views)
    }

    func setupConstraints() {}
}

// MARK: - Alert

extension ViewController {

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

// MARK: - ViewController Helpers

extension ViewController {

    // MARK: Views

    func addSubViews(for views: [UIView]) {
        for view in views {
            self.view.addSubview(view)
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

// MARK: - Navigation

extension ViewController {

    func presentRegisterScene() {
        present(viewController: RegisterViewController(), style: .push)
    }

    func presentHomeScene() {
        present(viewController: HomeViewController(), style: .modalFull)
    }

    func presentTransactionListScene() {}

    // MARK: Navigation helpers

    enum PresentationStyle {
        case modalFull
        case modal
        case push
        case show
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
            navigationController.modalTransitionStyle = .crossDissolve
            present(navigationController, animated: animated, completion: completion)
        case .modal:
            let navigationController = UINavigationController(rootViewController: viewController)
            present(navigationController, animated: animated, completion: completion)
        case .push:
            navigationController?.pushViewController(viewController, animated: animated)
        case .show:
            navigationController?.show(viewController, sender: self)
        }
    }
}
