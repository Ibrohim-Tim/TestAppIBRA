//
//  ProfileViewController.swift
//  IBRAHM22
//
//  Created by Ibrahim Timurkaev on 15.09.2023.
//

import UIKit

final class ProfileViewController: UITabBarController {
    
    //  MARK: - UI Elements
    
    private let button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Пользователь 1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let button2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Пользователь 2", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0)
        button.layer.cornerRadius = 8
        return button
    }()
    
    //  MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchDown)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchDown)
        
        setupButton1Layout()
        setupButton2Layout()
    }
   
    //  MARK: - Private methods
    
    private func setupButton1Layout() {
        view.addSubview(button1)
        
        button1.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54).isActive = true
    }
    
    private func setupButton2Layout() {
        view.addSubview(button2)
        
        button2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -54).isActive = true
    }
    
    @objc
    private func button1Tapped() {
        let profileInfoVC1 = ProfileInfoViewController(avatar: UIImage(named: "arni"), userName: "Arnold", userSureName: "Schwarzenegger")
        
        navigationController?.pushViewController(profileInfoVC1, animated: true)
    }
    
    @objc
    private func button2Tapped() {
        let profileInfoVC2 = ProfileInfoViewController(avatar: UIImage(named: "joli"), userName: "Angelina", userSureName: "Jolie")
        
        navigationController?.pushViewController(profileInfoVC2, animated: true)
    }
}
