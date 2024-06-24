//
//  ListLigthNetworkViewModel.swift
//  lightning-network
//
//  Created by Pablo Rosalvo de Melo Lopes on 24/06/24.
//

import Foundation

final class ListLigthNetworkViewModel {
    
    private let api: NetworkApiProtocol
    private var model: [ListsNodes]?
    
    init(api: NetworkApiProtocol = Network()) {
        self.api = api
    }
    
    var modelList: [ListsNodes]? {
        return model
    }
        
    func fetchListNodes(_ completion: @escaping (RequestError?) -> Void) {
        api.fetchListNodes { [weak self] model, error in
            guard error == nil else {
                completion(error)
                return
            }
            self?.model = model
            completion(error)
        }
    }
    
}