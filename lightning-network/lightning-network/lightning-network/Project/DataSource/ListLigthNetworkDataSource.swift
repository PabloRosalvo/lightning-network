//
//  ListLigthNetworkDataSource.swift
//  lightning-network
//
//  Created by Pablo Rosalvo de Melo Lopes on 24/06/24.
//
import UIKit

protocol ListNetworkDataSourceDelegate: AnyObject {
    func seletectIndexPathRow(_ model: ListsNodes)
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
    
    func getNameRepository(_ indexPath: IndexPath) -> String {
        return viewModel?.modelList?[indexPath.row].publicKey ?? ""
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
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        return CGSize(width: widthPerItem - 8, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let listsNodes = ListsNodes(publicKey: viewModel?.modelList?[indexPath.row].publicKey ?? "",
                                    alias: "", channels: 1, capacity: 1, firstSeen: 1, updatedAt: 1, city: City(de: "", en: "", es: "", fr: "", ja: "", ptBR: "", ru: "", zhCN: ""), country: City(de: "", en: "", es: "", fr: "", ja: "", ptBR: "", ru: "", zhCN: ""), isoCode: "", subdivision: "")
        
        self.delegate?.seletectIndexPathRow(listsNodes)
    }

}

extension LigthNetworkDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModel?.modelList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", 
                                                      for: indexPath) as? ListLigthNetworkGoogleCollectionViewCell
        cell?.setup(nameRepository: getNameRepository(indexPath))
        guard let cell = cell else { return .init() }
        return cell
    }
    
}
