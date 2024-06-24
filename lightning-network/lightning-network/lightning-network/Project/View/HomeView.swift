import UIKit

protocol HomeDelegate: AnyObject {
    func actionButton()
}

final class HomeView: UIView, ViewConfiguration {
    
    weak var delegate: HomeDelegate?

    private lazy var imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "image-lightning")
        imageview.layer.cornerRadius = 14
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = LocalizedString.titleHome.localized
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private(set) lazy var actionButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(LocalizedString.titleButtonHome.localized, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 18
        button.titleColor(for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        backgroundColor = .white
        self.actionButton.addTarget(self, action: #selector(self.actionButton(_:)), for: .touchUpInside)
    }
    
    @objc
    private func actionButton(_ sender: UIButton) {
        self.delegate?.actionButton()
    }

    func setupViewHierarchy() {
        addSubview(imageView)
        addSubview(label)
        addSubview(actionButton)
    }
    
    func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 60),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 48),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -48),
        
            actionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            actionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            actionButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -54),
            actionButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}
