import UIKit

public extension UIViewController {
    var ds: ErrorGeneric {
        return ErrorGeneric(self)
    }
}

public class ErrorGeneric {
    
    let viewController: UIViewController
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    public func showError(reload: (() -> Void)? = nil) {
        let errorView = ErrorViewGeneric()
        errorView.reloadAction = reload
        viewController.view.addSubview(errorView)
        errorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            errorView.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            errorView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            errorView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
            errorView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor)
        ])

    }
}
