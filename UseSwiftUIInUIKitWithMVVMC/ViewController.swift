//
//  ViewController.swift
//  UseSwiftUIInUIKitWithMVVMC
//
//  Created by ahmed on 21/07/2024.
//

import UIKit

class ViewController: UIViewController {

    private let coordinator: AppCoordinator
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        coordinator.openSwiftUIView()
    }
}

