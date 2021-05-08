//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit
import SnapKit

final class LoginViewController: CPViewController {

    private let UIComponent = UIComponentBuilder.self

    // MARK: - UI components

    private lazy var phoneNumberTextField: TextField = {
        UIComponent.phoneNumberTextField()
    }()

    private lazy var passwordTextField: UITextField = {
        UIComponent.passwordTextField()
    }()

    private lazy var loginButton: Button = {
        UIComponent.button(
            title: "Login",
            style: .filled,
            onTap: { [weak self] in
                self?.onLoginButtonTap()
            }
        )
    }()

    private lazy var components: [UIView] = {
        [
            phoneNumberTextField,
            passwordTextField,
            loginButton
        ]
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    private func onLoginButtonTap() {}

    // MARK: - Setup View

    override func setupView(with views: [UIView]) {
        super.setupView(with: components)
        title = "Login"
        navigationController?.navigationBar.isHidden = true
    }

    override func setupConstraints() {
        super.setupConstraints()

        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.centerX.equalTo(view)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.centerX.equalTo(view)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.centerX.equalTo(view)
        }
    }
}
