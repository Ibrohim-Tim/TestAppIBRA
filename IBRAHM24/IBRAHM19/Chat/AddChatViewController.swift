//
//  AddChatViewController.swift
//  IBRAHM22
//
//  Created by Ibrahim Timurkaev on 24.09.2023.
//

import UIKit

protocol NewChatViewControllerDelegate: AnyObject {
    func newChatSendMessageButtonTapped(avatar: UIImage?, username: String, message: String)
}

final class AddChatViewController: UIViewController {
    
    weak var delegate: NewChatViewControllerDelegate?
    
    //  MARK: - UI Elements
    
    private let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 2
        textField.placeholder = "Имя пользователя"
        textField.leftView = UIView(
            frame: CGRect(x: 0, y: 0, width: 12, height: 0)
        )
        textField.leftViewMode = .always
        return textField
    }()
    
    private let messageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 2
        textField.placeholder = "Сообщение"
        textField.leftView = UIView(
            frame: CGRect(x: 0, y: 0, width: 12, height: 0)
        )
        textField.leftViewMode = .always
        return textField
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Отправить", for: .normal)
        button.layer.cornerRadius = 4
        return button
    }()
    
    //  MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchDown)
        
        usernameTextField.delegate = self
        messageTextField.delegate = self
        
        setupUsernameTextFieldLayout()
        setupMessageTextFieldLayout()
        setupSendButtonLayout()
    }
    
    //  MARK: - Private methods

    private func setupUsernameTextFieldLayout() {
        view.addSubview(usernameTextField)
        
        usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupMessageTextFieldLayout() {
        view.addSubview(messageTextField)
        
        messageTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 8).isActive = true
        messageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        messageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        messageTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupSendButtonLayout() {
        view.addSubview(sendButton)
        
        sendButton.topAnchor.constraint(equalTo: messageTextField.bottomAnchor, constant: 24).isActive = true
        sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func handleUsernameText(_ text: String?) -> Bool {
        guard let text = text else {return false}

        return !text.isEmpty
    }
    
    private func handleMessageText(_ text: String?) -> Bool {
        guard let text = text else {return false}
        
        return !text.isEmpty
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @objc
    private func sendButtonTapped() {
        
        guard let username = usernameTextField.text,
              let message = messageTextField.text,
              !username.isEmpty,
              !message.isEmpty
        else {
            return showAlert(message: "Заполните пустые графы")
        }
        
        dismiss(animated: true) { [weak self] in
            self?.delegate?.newChatSendMessageButtonTapped(avatar: UIImage(named: "ibra"), username: username, message: message)
        }
    }
}

//  MARK: - UITextFieldDelegate

extension AddChatViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {return false}
        if textField == usernameTextField {
            if handleUsernameText(usernameTextField.text) {
                messageTextField.becomeFirstResponder()
            } else {
                showAlert(message: "Должно быть имя пользователя")
            }
        } else {
            if handleMessageText(messageTextField.text) {
                textField.resignFirstResponder()
            } else {
                showAlert(message: "Должно быть сообщение")
            }
        }
        
        return true
    }
}
