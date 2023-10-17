//
//  StatusTableViewCell.swift
//  IBRAHM19
//
//  Created by Ibrahim Timurkaev on 13.10.2023.
//

import UIKit

final class StatusTableViewCell: UITableViewCell {

    static let reuseId = "StatusTableViewCell"
    
    //  MARK: - UI Elements
    
    private let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.tintColor = .black
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private let timestampLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()

    //  MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupAvatarImageViewLayout()
        setupStackViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Private methods
    
    private func setupAvatarImageViewLayout() {
        contentView.addSubview(statusImageView)
        
        statusImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        statusImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        statusImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        statusImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupStackViewLayout() {
        contentView.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: statusImageView.trailingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        
        stackView.addArrangedSubview(usernameLabel)
        stackView.addArrangedSubview(timestampLabel)
    }
    
    func configure(item: StatusItem) {
        
        statusImageView.image = item.image
        usernameLabel.text = item.username
        timestampLabel.text = item.timestamp
    }
}
