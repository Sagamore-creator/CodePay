//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    deinit {
        print("BASE VIEWCONTROLLER - DEINITED")
    }

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
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}

// MARK: - Child ViewController

extension ViewController {

    func childViewController(viewController: UIViewController) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
        setupChildConstraints(viewController: viewController)
        viewController.view.backgroundColor = .red
    }

    private func setupChildConstraints(viewController: UIViewController) {
        viewController.view.translatesAutoresizingMaskIntoConstraints = false

        viewController.view.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(200)
        }
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

    // FIXME: make nice child VC
    func presentHomeScene() {
        present(viewController: HomeViewController(), style: .modalFull)
    }

    func presentTransactionList() {}
    func presentTransactionInfo() {}
    func presentAddMoney() {}
    func presentSendMoney() {}
    func presentSettings() {}

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
            navigationController.modalPresentationCapturesStatusBarAppearance = true
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
