import UIKit

final class LightningNetworkViewController: UIViewController, UISearchBarDelegate {
    
    private let viewModel: ListLigthNetworkViewModel

    
    private let contentView: LightningNetworkView = {
        let view = LightningNetworkView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var dataSource: LigthNetworkDataSource = {
        let source = LigthNetworkDataSource(delegate: self)
        return source
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchListNodes()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(back))
        self.view.backgroundColor = .white
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    init(viewModel: ListLigthNetworkViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func back() {
        navigationController?.popViewController(animated: true)
    }
    
    private func fetchListNodes() {
        self.startActivityIndicator()
            self.viewModel.fetchListNodes { [weak self] error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.stopActivityIndicator()
                if error == nil {
                    self.dataSource.setViewModel(viewModel: self.viewModel)
                    self.contentView.setDataSource(self.dataSource)
                    self.contentView.collectionView.reloadData()
                } else {
                    self.handleError()
                }
            }
        }
    }
    
    private func handleError() {
        
    }
    
}

extension LightningNetworkViewController: ListNetworkDataSourceDelegate {
    
    func seletectIndexPathRow(_ model: ListsNode) {

    }
    
}
