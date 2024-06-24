import SwiftUI
import UIKit

struct UIKitViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = UINavigationController
    var homeCoordinator: HomeCoordinator?
    init() {
        let navigationController = UINavigationController()
        homeCoordinator = HomeCoordinator(navigationController: navigationController)
    }
    func makeUIViewController(context: Context) -> UINavigationController {
        homeCoordinator?.start()
        guard let homeCoordinator = homeCoordinator?.navigationController else { return .init()}
        return homeCoordinator
    }
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}
    
