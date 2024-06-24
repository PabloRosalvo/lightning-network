import UIKit

extension UIViewController {
    private struct ActivityIndicator {
        static var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
        static var titleLabel: UILabel = UILabel()
    }
    
    func startActivityIndicator(style: UIActivityIndicatorView.Style = .large, location: CGPoint? = nil, title: String? = nil) {
        let activityIndicator = ActivityIndicator.activityIndicator
        activityIndicator.style = style
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = ActivityIndicator.titleLabel
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.isHidden = title == nil
        
        DispatchQueue.main.async {
            self.view.addSubview(activityIndicator)
            self.view.addSubview(titleLabel)
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 8),
                titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
            activityIndicator.startAnimating()
        }
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async {
            ActivityIndicator.activityIndicator.stopAnimating()
            ActivityIndicator.activityIndicator.removeFromSuperview()
            ActivityIndicator.titleLabel.removeFromSuperview()
        }
    }
}
