//
//  ListLigthNetworkGoogleCollectionViewCell.swift
//  lightning-network
//
//  Created by Pablo Rosalvo de Melo Lopes on 24/06/24.
//

import UIKit

final class ListLigthNetworkGoogleCollectionViewCell: UICollectionViewCell {
    
    var activityView: UIActivityIndicatorView?
    
    private let nameRepository: UILabel  = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 25
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.configureViews()
        self.setupViewHierarchy()
        self.setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        self.backgroundColor = .black
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    func setup(nameRepository: String) {
        self.nameRepository.text = nameRepository
    }
    
    func setDataSource(_ dataSource: LigthNetworkDataSource) {
        self.collectionView.delegate = dataSource
        self.collectionView.dataSource = dataSource
        dataSource.collectionView = self.collectionView
    }
    private func setupViewHierarchy() {
        self.contentView.addSubview(nameRepository)
    }
    
    private func setupConstraints() {
        self.nameRepository.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameRepository.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            nameRepository.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            nameRepository.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
        ])
    }
    
}
