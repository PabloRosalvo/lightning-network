//
//  ListLigthNetworkDataSource.swift
//  lightning-network
//
//  Created by Pablo Rosalvo de Melo Lopes on 24/06/24.
//
import UIKit

protocol ListNetworkDataSourceDelegate: AnyObject {
    func seletectIndexPathRow(_ model: ListsNode)
}

final class LigthNetworkDataSource: NSObject, UISearchBarDelegate {

    private weak var delegate: ListNetworkDataSourceDelegate?

    private var viewModel: ListLigthNetworkViewModel? {
        didSet {
            collectionView?.reloadData()
        }
    }
        
    init(delegate: ListNetworkDataSourceDelegate) {
        self.delegate = delegate
    }
    
    func setViewModel(viewModel: ListLigthNetworkViewModel) {
        self.viewModel = viewModel
    }
    
    var collectionView: UICollectionView? {
        didSet {
            collectionView?.register(ListLigthNetworkGoogleCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
  
}

extension LigthNetworkDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 300, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width - lay.minimumInteritemSpacing
        return CGSize(width: widthPerItem - 8, height: 300)
    }

}

extension LigthNetworkDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModel?.modelList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", 
                                                      for: indexPath) as? ListLigthNetworkGoogleCollectionViewCell
        guard let cell = cell, let viewModel = viewModel else { return .init() }
        cell.setup(viewModel, indexPath)
        return cell
    }
    
}
