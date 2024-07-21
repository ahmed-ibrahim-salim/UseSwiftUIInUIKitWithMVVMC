//
//  AppRootCoordinator.swift
//  UseSwiftUIInUIKitWithMVVMC
//
//  Created by ahmed on 21/07/2024.
//

import UIKit
import SwiftUI

class AppCoordinator {
    
    var navigationController: UINavigationController = UINavigationController()
    var window: UIWindow
    
    // MARK: - Initializer
    init(navigationController: UINavigationController, window: UIWindow) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
        openVC()
    }
    
    func openVC() {
        let vc = ViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func openSwiftUIView() {
        let vc = ControlledNavigationHostingController(
            shouldShowNavigationBar: false,
            rootView: SwiftUIView(coordinator: self)
        )
        vc.navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(vc, animated: true)
    }
    
}

/// to solve the problem of not showing the navigation bar
class ControlledNavigationHostingController<Content>: UIHostingController<AnyView> where Content: View {
    
    public init(shouldShowNavigationBar: Bool, rootView: Content) {
        super.init(rootView: AnyView(rootView.navigationBarHidden(!shouldShowNavigationBar)))
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
