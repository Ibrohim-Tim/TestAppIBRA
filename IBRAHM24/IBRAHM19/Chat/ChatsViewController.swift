//
//  Chats1ViewController.swift
//  IBRAHM22
//
//  Created by Ibrahim Timurkaev on 18.09.2023.
//
//
import UIKit

final class ChatsViewController: UIViewController {
    
    //  MARK: - UI Elements

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        return tableView
    }()

    private var chatItems = [
        ChatItem(avatar: UIImage(named: "joli"), username: "Angelina Jolie", lastMessage: "I love you <3"),
        ChatItem(avatar: UIImage(named: "arni"), username: "Arnold Schwarzenegger", lastMessage: "Let's go to gym!!!"),
        ChatItem(avatar: UIImage(named: "elon"), username: "Elon Musk", lastMessage: "I'll repay the debt soon..."),
        ChatItem(avatar: nil, username: "Barack Obeme", lastMessage: "You are new president of USA")
    ]

    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        title = "Чаты"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Удалить",
            style: .plain,
            target: self,
            action: #selector(deleteChatsViewControllerButton)
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addChatViewControllerButton)
        )

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(ChatItemViewCell.self, forCellReuseIdentifier: ChatItemViewCell.reuseId)

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

extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatItemViewCell.reuseId, for: indexPath) as? ChatItemViewCell else {
            fatalError("Can not dequeue SecondChatItemTableViewCell")
        }
        let item = chatItems[indexPath.row]

        cell.selectionStyle = .none
        cell.configure(item: item)

        return cell
    }
}

//  MARK: - UITableViewDelegate

extension ChatsViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "Удалить") { [weak self] _, _, complection in
                self?.handleDeleteAction(indexPath: indexPath)
                complection(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

//  MARK: - ChatsViewController

extension ChatsViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatItem = chatItems[indexPath.row]
        let viewcontroller = ChatInfoViewController(chatItem: chatItem)
        viewcontroller.title = chatItem.username
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    @objc
    func addChatViewControllerButton() {
        let vc = AddChatViewController()
        vc.title = "Новый чат"
        vc.delegate = self
        present(vc, animated: true)
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func deleteChatsViewControllerButton() {
        let alert = UIAlertController(title: "Вы уверены?", message: "Удаленные чаты нельзя будет восстановить", preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "Да", style: .destructive) { [weak self] _ in
            guard let self = self else { return }
            
            self.chatItems = []
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    private func handleDeleteAction(indexPath: IndexPath) {
        let alert = UIAlertController(title: "Вы уверены?", message: "Удаленный чат нельзя будет восстановить", preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "Да", style: .destructive) { [weak self] _ in
            guard let self = self else { return }
            
            self.chatItems.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .none)
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel)
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}

// MARK: - NewChatViewControllerDelegate

extension ChatsViewController: NewChatViewControllerDelegate {
    
    func newChatSendMessageButtonTapped(avatar: UIImage?, username: String, message: String) {
        let indexPath = IndexPath(row: chatItems.count, section: 0)
        
        let newItem = ChatItem(avatar: avatar, username: username, lastMessage: message)
        
        chatItems.append(newItem)
        
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}
