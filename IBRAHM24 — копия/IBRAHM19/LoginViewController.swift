//
//  LoginViewController.swift
//  IBRAHM22
//
//  Created by Ibrahim Timurkaev on 21.09.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //  MARK: - UI Elements
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Имя пользователя: "
        label.textColor = .black
        return label
    }()
    
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Пароль: "
        label.textColor = .black
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 2
        textField.placeholder = "Введите имя пользователя"
        textField.leftView = UIView(
            frame: CGRect(x: 0, y: 0, width: 12, height: 0)
        )
        textField.leftViewMode = .always
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 2
        textField.placeholder = "Введите пароль"
        textField.leftView = UIView(
            frame: CGRect(x: 0, y: 0, width: 12, height: 0)
        )
        textField.leftViewMode = .always
        return textField
    }()
    
    //  MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        setupUsernameTextFieldLayout()
        setupPasswordTextFieldLayout()
        setupUsernameLabelLayout()
        setupPasswordLabelLayout()
    }
    
    //  MARK: - Private methods
    
    private func setupUsernameTextFieldLayout() {
        view.addSubview(usernameTextField)
        
        usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupPasswordTextFieldLayout() {
        view.addSubview(passwordTextField)
        
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 8).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupUsernameLabelLayout() {
        view.addSubview(usernameLabel)
        
        usernameLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
    }
    
    private func setupPasswordLabelLayout() {
        view.addSubview(passwordLabel)
        
        passwordLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 16).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
    }
    
    private func handleUsernameText(_ text: String?) -> Bool {
        guard let text = text else {return false}

        return text.count > 5
    }
    
    private func handlePasswordText(_ text: String?) -> Bool {
        guard let text = text else {return false}
        
        return text.count > 5
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//  MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {return false}
        if textField == usernameTextField {
            if handleUsernameText(usernameTextField.text) {
                usernameLabel.text = "Имя пользователя: \(text)"
                passwordTextField.becomeFirstResponder()
            } else {
                showAlert(message: "Минимальная длина имени - 5 символов")
            }
        } else {
            if handlePasswordText(passwordTextField.text) {
                passwordLabel.text = "Пароль: \(text)"
                textField.resignFirstResponder()
            } else {
                showAlert(message: "Минимальная длина пароля - 5 символов")
            }
        }
        
        return true
    }
}

