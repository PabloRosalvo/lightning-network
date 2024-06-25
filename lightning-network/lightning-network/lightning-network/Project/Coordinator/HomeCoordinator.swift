import UIKit

protocol HomeCoordinatorActionDelegate: AnyObject {
    func goToListLightning()
    func back()
}

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    weak var parentCoordinator: Coordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        viewModel.actionButtonTapped = { [weak self] in
            self?.goToListLightning()
        }
        viewController.coordinator = self
        navigationController.setViewControllers([viewController], animated: false)
    }

    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }

    func goToListLightning() {
        let viewModel = ListLigthNetworkViewModel()
        let controller = LightningNetworkViewController(viewModel: viewModel)
        viewModel.actionBackButtonTapped = { [weak self] in
            self?.back()
        }
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: false)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}
