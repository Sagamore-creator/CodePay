//  Created by Lech Lipnicki on 2021-05-07.
//

import UIKit
import SnapKit

final class RegisterViewController: ViewController {
    private let UIComponent = UIComponentBuilder.self
    private var selectedCurrency: String = ""

    deinit {
        print("REGISTER SCENE - DEINITED")
    }

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

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = color(.bluePay)
        return indicator
    }()

    private lazy var components: [UIView] = {
        [
            phoneNumberTextField,
            passwordTextField,
            confirmPasswordTextField,
            currencySelectionView,
            registerButton,
            activityIndicator
        ]
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    private func onRegisterButtonTap() {
        handleRegistration(
            phoneNumber: phoneNumberTextField.text,
            password: passwordTextField.text,
            confirmPassword: confirmPasswordTextField.text,
            currency: currencySelectionView.selectedValue
        )
    }

    private func onCurrencySelectionTap() {
        let currencySelectionViewController = CurrencyTableViewController(with: currency)

        currencySelectionViewController.onCurrencySelect = { [weak self] currency in
            guard let self = self else { return }
            self.currencySelectionView.setSelectedValue(currency)
            self.selectedCurrency = currency
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

        activityIndicator.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(30)
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.centerX.equalTo(view)
        }
    }
}

// MARK: - Handle Registration

private extension RegisterViewController {

    func handleRegistration(
        phoneNumber: String?,
        password: String?,
        confirmPassword: String?,
        currency: String?
    ) {
        activityIndicator.show()
        API.UsersRoute.get(with: phoneNumber).result { [weak self] result in
            switch result {
            case .success(let users):
                UserManager.user = users.first

                self?.tryRegister(
                    phoneNumber: phoneNumber,
                    password: password,
                    confirmPassword: confirmPassword,
                    currency: currency
                )

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func tryRegister(
        phoneNumber: String?,
        password: String?,
        confirmPassword: String?,
        currency: String?
    ) {
        DispatchQueue.main.async { [weak self] in
            do {
                self?.activityIndicator.hide()

                try UserManager.registerUserAndAccount(
                    phoneNumber: phoneNumber,
                    password: password,
                    confirmPassword: confirmPassword,
                    currency: currency
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
