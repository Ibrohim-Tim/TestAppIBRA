//
//  CallsListViewController.swift
//  IBRAHM19
//
//  Created by Ibrahim Timurkaev on 29.09.2023.
//

import UIKit

final class CallsListViewController: UIViewController {
    
    //  MARK: - UI Elements
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        return tableView
    }()
    
    private var callItems = [
        CallItem(avatar: UIImage(named: "joli"), username: "Angelina Jolie", callStatus: "Входящий"),
        CallItem(avatar: UIImage(named: "joli"), username: "Angelina Jolie", callStatus: "Пропущенный"),
        CallItem(avatar: UIImage(named: "arni"), username: "Arnold Schwarzenegger", callStatus: "Исходящий"),
        CallItem(avatar: UIImage(named: "arni"), username: "Arnold Schwarzenegger", callStatus: "Входящий"),
        CallItem(avatar: UIImage(named: "elon"), username: "Elon Musk", callStatus: "Входящий"),
        CallItem(avatar: UIImage(named: "arni"), username: "Arnold Schwarzenegger", callStatus: "Пропущенный"),
        CallItem(avatar: UIImage(named: "elon"), username: "Elon Musk", callStatus: "Входящий"),
        CallItem(avatar: nil, username: "Barack Obeme", callStatus: "Пропущенный"),
        CallItem(avatar: UIImage(named: "elon"), username: "Elon Musk", callStatus: "Исходящий"),
        CallItem(avatar: nil, username: "Barack Obeme", callStatus: "Пропущенный"),
        CallItem(avatar: nil, username: "Barack Obeme", callStatus: "Пропущенный")
    ]
    
    //  MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        title = "Звонки"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CallItemTableViewCell.self, forCellReuseIdentifier: CallItemTableViewCell.reuseID)
        
        setupTableViewLayout()
    }
    
    //  MARK: - Private methods
    
    private func setupTableViewLayout() {
        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

//  MARK: - UITableViewDataSource

extension CallsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        callItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CallItemTableViewCell.reuseID, for: indexPath) as? CallItemTableViewCell else {
            fatalError("Can not dequeue SecondChatItemTableViewCell")
        }
        let item = callItems[indexPath.row]

        cell.selectionStyle = .none
        cell.configure(item: item)
        cell.accessoryType = .detailButton

        return cell
    }
}

//  MARK: - UITableViewDelegate

extension CallsListViewController: UITableViewDelegate {
    
}

//  MARK: - CallsListViewController

extension CallsListViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let callItem = callItems[indexPath.row]
        let viewcontroller = CallInfoViewController(callItem: callItem)
        viewcontroller.title = callItem.username
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
