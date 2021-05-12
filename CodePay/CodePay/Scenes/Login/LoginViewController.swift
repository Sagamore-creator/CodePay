//  Created by Lech Lipnicki on 2021-05-05.
//

import UIKit
import SnapKit

final class LoginViewController: ViewController {

    deinit {
        print("LoginViewController DEINITED")
    }

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
        let homeViewController = HomeViewController()
        present(viewController: homeViewController, style: .modalFull)
    }

    private func onRegisterButtonTap() {
        let registerViewController = RegisterViewController()
        present(viewController: registerViewController, style: .push)
    }

    // MARK: - Setup View

    override func setupView(with views: [UIView]) {
        super.setupView(with: components)
        title = "LOGIN SCENE"
        navigationController?.navigationBar.isHidden = false
    }

    override func setupConstraints() {
        super.setupConstraints()

        logo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.height.equalTo(IconSize.xxxLarge.size)
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

//#if DEBUG
//import SwiftUI
//
//struct LoginViewController_Preview: PreviewProvider {
//    static var previews: some View {
//        ViewControllerRepresentable {
//            return LoginViewController()
//        }
//    }
//}
//#endif
