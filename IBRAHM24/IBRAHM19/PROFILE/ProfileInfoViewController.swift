//
//  ProfileInfoViewController.swift
//  IBRAHM22
//
//  Created by Ibrahim Timurkaev on 17.09.2023.
//

import UIKit

final class ProfileInfoViewController: UIViewController {
    
    //  MARK: - UI Elements
    
    private let avatarImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.fill")
        image.backgroundColor = .systemGray
        image.clipsToBounds = true
        return image
    }()
    
    private let userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.font = .boldSystemFont(ofSize: 20)
        return userNameLabel
    }()
    
    private let userSureNameLabel: UILabel = {
        let userSureNameLabel = UILabel()
        userSureNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return userSureNameLabel
    }()
    
    //  MARK: - Init
    
    init(avatar: UIImage?, userName: String, userSureName: String) {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = .white
        
        avatarImage.image = avatar
        userNameLabel.text = userName
        userSureNameLabel.text = userSureName
        
        setupAvatarImageLayout()
        setupUserNameLabelLayout()
        setupLastMessageLabelLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Private methods
    
    private func setupAvatarImageLayout() {
        view.addSubview(avatarImage)
        
        avatarImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 68).isActive = true
        avatarImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18).isActive = true
        avatarImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setupUserNameLabelLayout() {
        view.addSubview(userNameLabel)
        
        userNameLabel.topAnchor.constraint(equalTo: avatarImage.topAnchor, constant: 12).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20).isActive = true
    }
    
    private func setupLastMessageLabelLayout() {
        view.addSubview(userSureNameLabel)
        
        userSureNameLabel.bottomAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: -12).isActive = true
        userSureNameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20).isActive = true
    }
    
    @objc
    private func buttonTapped() {
        dismiss(animated: true)
    }
}
