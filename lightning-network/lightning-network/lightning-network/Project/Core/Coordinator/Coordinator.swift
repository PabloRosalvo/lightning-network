//
//  Coordinator.swift
//  lightning-network
//
//  Created by Pablo Rosalvo de Melo Lopes on 23/06/24.
//

import UIKit

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    func start()
    func childDidFinish(_ child: Coordinator?)
    func didFinish()
}

extension Coordinator {
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}
