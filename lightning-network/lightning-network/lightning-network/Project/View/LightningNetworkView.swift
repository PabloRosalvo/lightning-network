//
//  LightningNetworkView.swift
//  ListRepositoryGoogle
//
//  Created by Pablo Rosalvo de Melo Lopes on 24/06/24.
//

import UIKit

class LightningNetworkView: UIView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lista de Lightning"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 25
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureViews()
        setupViewHierarchy()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureViews() {
        collectionView.backgroundColor = .white
    }
    
    func setDataSource(_ dataSource: LigthNetworkDataSource) {
        self.collectionView.delegate = dataSource
        self.collectionView.dataSource = dataSource
        dataSource.collectionView = self.collectionView
    }

    private func setupViewHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(collectionView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),

            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
