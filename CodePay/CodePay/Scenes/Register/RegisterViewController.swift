//  Created by Lech Lipnicki on 2021-05-07.
//

import UIKit
import SnapKit

final class RegisterViewController: ViewController {
    private let UIComponent = UIComponentBuilder.self

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

    private lazy var currencySelectionView: SelectionView = {
        UIComponent.selectionView(
            title: "Currency",
            value: nil,
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
    }

    // MARK: - Actions

    private func onRegisterButtonTap() {
        let homeViewController = HomeViewController()
        present(viewController: homeViewController, style: .push)
    }

    private func onCurrencySelectionTap() {
        let currencySelectionViewController = SelectionTableViewController(with: currency)

        currencySelectionViewController.onDismiss = { [weak self] selection in
            guard let self = self else { return }
            self.currencySelectionView.setSelectedValue(selection)
        }

        present(viewController: currencySelectionViewController, style: .modalFull)
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
