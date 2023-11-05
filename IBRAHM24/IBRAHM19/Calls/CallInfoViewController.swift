//
//  CallInfoViewController.swift
//  IBRAHM19
//
//  Created by Ibrahim Timurkaev on 30.09.2023.
//

import UIKit

final class CallInfoViewController: UIViewController {

    //  MARK: - Init
    
    init(callItem: CallItem) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        navigationItem.largeTitleDisplayMode = .never
    }
}

