//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit
import SnapKit

final class LoginViewController: ViewController {

    private let UIComponent = UIComponentBuilder.self

    // MARK: - UI components

    private lazy var logo: UIImageView = {
        UIImageView(image: Icon.logo.image)
    }()

    private lazy var phoneNumberTextField: UITextField = {
        UIComponent.phoneNumberTextField()
    }()

    private lazy var passwordTextField: UITextField = {
        UIComponent.passwordTextField()
    }()

    private lazy var loginButton: UIButton = {
        UIComponent.button(
            title: "Login",
            style: .filled,
            onTap: { [weak self] in
                self?.onLoginButtonTap()
            }
        )
    }()

    private lazy var registerButton: UIButton = {
        UIComponent.button(
            title: "Register",
            style: .hollow,
            onTap: { [weak self] in
                self?.onRegisterButtonTap()
            }
        )
    }()

    private lazy var components: [UIView] = {
        [
            logo,
            phoneNumberTextField,
            passwordTextField,
            loginButton,
            registerButton
        ]
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions

    private func onLoginButtonTap() {
        handleLogin(
            phoneNumber: phoneNumberTextField.text,
            password: passwordTextField.text
        )
    }

    private func onRegisterButtonTap() {
        presentRegisterScene()
    }

    // MARK: - Setup View

    override func setupView(with views: [UIView]) {
        super.setupView(with: components)
        navigationController?.navigationBar.isHidden = true
    }

    override func setupConstraints() {
        super.setupConstraints()

        logo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(150)
            make.width.equalTo(logo.snp.height)
            make.centerX.equalTo(view)
        }

        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(20)
            make.height.equalTo(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalTo(view)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(20)
            make.height.equalTo(phoneNumberTextField.snp.height)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalTo(view)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(passwordTextField.snp.height)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalTo(view)
        }

        registerButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(20)
            make.height.equalTo(passwordTextField.snp.height)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalTo(view)
        }
    }
}

// MARK: - Handle Login

private extension LoginViewController {

    func handleLogin(phoneNumber: String?, password: String?) {
        API.UsersRoute.get(with: phoneNumber).result { [weak self] result in
            switch result {
            case .success(let users):
                UserManager.user = users.first
                self?.tryLogin(with: phoneNumber, and: password)
                //UserManager.user = nil
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func tryLogin(with phoneNumber: String?, and password: String?) {
        DispatchQueue.main.async { [weak self] in
            do {
                try UserManager.loginUser(
                    phoneNumber: phoneNumber,
                    password: password
                )
                self?.presentHomeScene()
            } catch {
                if let error = error as? UserManager.ErrorMessage {
                    self?.showAlert(message: error.description)
                }
            }
        }
    }
}
