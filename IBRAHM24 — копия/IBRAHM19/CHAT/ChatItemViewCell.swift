//
//  View.swift
//  IBRAHM22
//
//  Created by Ibrahim Timurkaev on 15.09.2023.
//

import UIKit

final class ChatItemViewCell: UITableViewCell {
    
    static let reuseId = "ChatItemView"
    
    //  MARK: - UI Elements
    
    private let avatarImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.fill")
        image.backgroundColor = .systemGray
        image.tintColor = .white
        image.layer.borderWidth = 5
        image.layer.borderColor = CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        return image
    }()
    
    private let userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.font = .boldSystemFont(ofSize: 20)
        return userNameLabel
    }()
    
    private let lastMessageLabel: UILabel = {
        let lastMessageLabel = UILabel()
        lastMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        lastMessageLabel.textColor = .gray
        return lastMessageLabel
    }()
    
    //  MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupAvatarImageLayout()
        setupUserNameLabelLayout()
        setupLastMessageLabelLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Private methods
    
    private func setupAvatarImageLayout() {
        addSubview(avatarImage)
        
        avatarImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 18).isActive = true
        avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18).isActive = true
        avatarImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18).isActive = true
        avatarImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setupUserNameLabelLayout() {
        addSubview(userNameLabel)
        
        userNameLabel.topAnchor.constraint(equalTo: avatarImage.topAnchor, constant: 12).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20).isActive = true
    }
    
    private func setupLastMessageLabelLayout() {
        addSubview(lastMessageLabel)
        
        lastMessageLabel.bottomAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: -12).isActive = true
        lastMessageLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20).isActive = true
    }
    
    func configure(item: ChatItem) {
        if let avatar = item.avatar {
            avatarImage.image = avatar
            avatarImage.layer.borderWidth = 1
        } else {
            avatarImage.image = UIImage(systemName: "person.fill")
        }
        
        userNameLabel.text = item.username
        lastMessageLabel.text = item.lastMessage
    }
}

