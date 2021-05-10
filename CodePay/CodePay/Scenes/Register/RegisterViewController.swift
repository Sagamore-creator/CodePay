//  Created by Lech Lipnicki on 2021-05-07.
//

import UIKit
import SnapKit

final class RegisterViewController: CPViewController {

    deinit {
        print("RegisterViewController DEINITED")
    }

    private let UIComponent = UIComponentBuilder.self
    //private let currencies = Locale.isoCurrencyCodes

    // MARK: - UI components

    private lazy var phoneNumberTextField: UITextField = {
        UIComponent.phoneNumberTextField()
    }()

    private lazy var passwordTextField: UITextField = {
        UIComponent.passwordTextField()
    }()

    private lazy var confirmPasswordTextField: UITextField = {
        UIComponent.passwordTextField(placeholder: "Confirm Password")
    }()

    private lazy var registerButton: UIButton = {
        UIComponent.button(
            title: "Register",
            style: .filled,
            onTap: { [weak self] in
                self?.onRegisterButtonTap()
            }
        )
    }()

    private lazy var currencySelectionView: UIView = {
        UIComponent.selectionView(
            title: "Currency",
            value: "USD",
            onTap: { [weak self] in
                self?.onCurrencySelectionTap()
            }
        )
    }()

    private lazy var components: [UIView] = {
        [
            phoneNumberTextField,
            passwordTextField,
            confirmPasswordTextField,
            currencySelectionView,
            registerButton
        ]
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        //print(currencies)
    }

    // MARK: - Actions

    private func onRegisterButtonTap() {
        let homeViewController = HomeViewController()
        present(viewController: homeViewController, style: .push)
    }

    private func onCurrencySelectionTap() {
        let currencySelectionViewController = SelectCurrencyTableViewController()
        present(viewController: currencySelectionViewController, style: .push)
    }

    // MARK: - Setup View

    override func setupView(with views: [UIView]) {
        super.setupView(with: components)
        title = "REGISTER SCENE"
        navigationController?.navigationBar.isHidden = false
    }

    override func setupConstraints() {
        super.setupConstraints()

        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
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

        confirmPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(phoneNumberTextField.snp.height)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalTo(view)
        }

        currencySelectionView.snp.makeConstraints { make in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(20)
            make.height.equalTo(phoneNumberTextField.snp.height)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalTo(view)
        }

        registerButton.snp.makeConstraints { make in
            make.top.equalTo(currencySelectionView.snp.bottom).offset(20)
            make.height.equalTo(phoneNumberTextField.snp.height)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerX.equalTo(view)
        }
    }
}

//#if DEBUG
//import SwiftUI
//
//struct RegisterViewController_Preview: PreviewProvider {
//    static var previews: some View {
//        ViewControllerRepresentable {
//            return RegisterViewController()
//        }
//    }
//}
//#endif
