//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit
import SnapKit

final class LoginViewController: CPViewController {

    private let UIComponent = UIComponentBuilder.self

    // MARK: - UI components

    private lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = CornerRadius.rounded.rawValue
        textField.textAlignment = .center
        textField.textColor = color(.darkGray)
        textField.autocorrectionType = .no
        textField.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        textField.placeholder = "Phone number"

        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = CornerRadius.rounded.rawValue
        textField.textAlignment = .center
        textField.textColor = color(.darkGray)
        textField.autocorrectionType = .no
        textField.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        textField.placeholder = "Password"

        return textField
    }()

    private lazy var loginButton: Button = {
        UIComponent.button(
            title: "Login",
            style: .filled,
            onTap: {}
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

    @objc private func loginButtonTapped() {
        print("loginButtonTapped Action!")
    }

    private func firstAction() {
        print("1: Action!")
    }

    @objc private func secondAction() {
        print("2: Action!")
    }

    private func thirdAction() {
        print("3: Action!")
    }

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
