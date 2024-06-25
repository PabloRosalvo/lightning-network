import UIKit

public class ErrorViewGeneric: UIView {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .purple
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purple
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .purple
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var actionButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LocalizedString.tryAgain.localized, for: .normal)
        button.titleColor(for: .highlighted)
        button.setTitleColor(.purple, for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    var reloadAction: (() -> Void)? = nil {
        didSet {
            actionButton.isHidden = false
        }
    }
        
    public init() {
        super.init(frame: .zero)
        setupViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @objc
    private func buttonAction() {
        reloadAction?()
        removeFromSuperview()
    }
}

// MARK: Configuration

extension ErrorViewGeneric {
    func setupViewHierarchy() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(actionButton)
    }
    
    func setupConstraints() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.actionButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 8),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            self.subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.actionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.actionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.actionButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -48),
            self.actionButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func configureViews() {
        imageView.image =  UIImage(named: "image-lightning")
        titleLabel.text = LocalizedString.messageError.localized
        subtitleLabel.text = LocalizedString.checkInternet.localized
        self.backgroundColor = .systemGroupedBackground
        actionButton.layer.borderColor = UIColor.purple.cgColor
        actionButton.layer.borderWidth = 1
        actionButton.layer.cornerRadius = 20
    }
}
