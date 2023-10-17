//
//  MainTabBarController.swift
//  IBRAHM22
//
//  Created by Ibrahim Timurkaev on 14.09.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    //  MARK: - UI Elements
    
    private var chatsViewController: UINavigationController {
        let chatsViewController = ChatsViewController()
        let navigationController = UINavigationController(rootViewController: chatsViewController)
        navigationController.tabBarItem = UITabBarItem(
            title: "Чаты",
            image: UIImage(systemName: "message"),
            selectedImage: UIImage(systemName: "message.fill")
        )
        return navigationController
    }
    
    private var profileViewController: UINavigationController {
        let profileViewController = ProfileViewController()
        let navigationController = UINavigationController(rootViewController: profileViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(systemName: "gear"),
            selectedImage: UIImage(systemName: "gear.circle.fill")
        )
        return navigationController
    }
    
    private var loginViewController: UINavigationController {
        let loginViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem = UITabBarItem(
            title: "Авторизация",
            image: UIImage(systemName: "person.crop.square"),
            selectedImage: UIImage(systemName: "person.crop.square.fill")
        )
        return navigationController
    }
    
    private var callsListViewController: UINavigationController {
        let callsListViewController = CallsListViewController()
        let navigationController = UINavigationController(rootViewController: callsListViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem = UITabBarItem(
            title: "Звонки",
            image: UIImage(systemName: "phone"),
            selectedImage: UIImage(systemName: "phone.fill")
        )
        return navigationController
    }
    
    private var statusViewController: UIViewController {
           let statusViewController = StatusViewController()
        statusViewController.tabBarItem = UITabBarItem(
               title: "Статус",
               image: UIImage(systemName: "circle.dashed"),
               selectedImage: UIImage(systemName: "circle.dashed.inset.fill")
           )
           return statusViewController
       }
    
    //  MARK: - Init

    init() {
        super .init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [statusViewController, callsListViewController, chatsViewController, profileViewController, loginViewController]
        
        selectedIndex = 2
    }
}
