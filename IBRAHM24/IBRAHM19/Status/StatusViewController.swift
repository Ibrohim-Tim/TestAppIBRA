//
//  StatusViewController.swift
//  IBRAHM19
//
//  Created by Ibrahim Timurkaev on 13.10.2023.
//

import UIKit

final class StatusViewController: UIViewController {
    
    //  MARK: - UI Elements
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
        return tableView
    }()
    
    private let sections = [
        Section(
            items: [
                StatusItem(image: UIImage(named: "ibra"), username: "Мой статус", timestamp: "Добавить в статус")
        ]),
        Section(
            items: [
                StatusItem(image: UIImage(named: "elon"), username: "Elon Musk", timestamp: "5 ч. назад"),
                StatusItem(image: UIImage(named: "joli"), username: "Angelina Jolie", timestamp: "16 ч. назад"),
                StatusItem(image: UIImage(named: "arni"), username: "Arnold Schwarzenegger", timestamp: "21 ч. назад")
        ])
    ]

    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Статус"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(MyStatusTableViewCell.self, forCellReuseIdentifier: MyStatusTableViewCell.reuseId)
        tableView.register(StatusTableViewCell.self, forCellReuseIdentifier: StatusTableViewCell.reuseId)
        
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

//  MARK: - UITableViewDelegate

extension StatusViewController: UITableViewDelegate {
    
}

//  MARK: - UITableViewDataSource

extension StatusViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = sections[indexPath.section]
        let item = section.items[indexPath.row]
        
        if indexPath.section % 2 == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MyStatusTableViewCell.reuseId,
                for: indexPath
            ) as? MyStatusTableViewCell else {
                fatalError("Can not dequeue SecondChatItemTableViewCell")
            }
            
            cell.selectionStyle = .none
            cell.configure(item: item)

            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StatusTableViewCell.reuseId,
                for: indexPath
            ) as? StatusTableViewCell else {
                fatalError("Can not dequeue ChatItemTableViewCell")
            }
            
            cell.selectionStyle = .none
            cell.configure(item: item)

            return cell
        }
    }
}
