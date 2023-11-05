//
//  CallItemTableViewCell.swift
//  IBRAHM19
//
//  Created by Ibrahim Timurkaev on 29.09.2023.
//

import UIKit

final class CallItemTableViewCell: UITableViewCell {
    
    static let reuseID = "CallItemTabelViewCell"
    
    //  MARK: - UI Elements
    
    private let avatarImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.fill")
        image.backgroundColor = .systemGray
        image.tintColor = .white
        image.layer.borderWidth = 2
        image.layer.borderColor = CGColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    private let userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.font = .boldSystemFont(ofSize: 18)
        return userNameLabel
    }()
    
    private let callStatusLabel: UILabel = {
        let lastMessageLabel = UILabel()
        lastMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        lastMessageLabel.textColor = .gray
        return lastMessageLabel
    }()
    
    //  MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        setupAvatarImageLayout()
        setupUserNameLabelLayout()
        setupLastMessageLabelLayout()
    }
    
    //  MARK: - Private methods
    
    private func setupAvatarImageLayout() {
        addSubview(avatarImage)
        
        avatarImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 18).isActive = true
        avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18).isActive = true
        avatarImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18).isActive = true
        avatarImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupUserNameLabelLayout() {
        addSubview(userNameLabel)
        
        userNameLabel.topAnchor.constraint(equalTo: avatarImage.topAnchor, constant: 2).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20).isActive = true
    }
    
    private func setupLastMessageLabelLayout() {
        addSubview(callStatusLabel)
        
        callStatusLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 6).isActive = true
        callStatusLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20).isActive = true
    }
    
    func configure(item: CallItem) {
        if let avatar = item.avatar {
            avatarImage.image = avatar
            avatarImage.layer.borderWidth = 1
        } else {
            avatarImage.image = UIImage(systemName: "person.fill")
        }
        
        userNameLabel.text = item.username
        callStatusLabel.text = item.callStatus
    }
}
