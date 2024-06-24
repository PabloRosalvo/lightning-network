//
//  HomeViewModel.swift
//  lightning-network
//
//  Created by Pablo Rosalvo de Melo Lopes on 24/06/24.
//

import Foundation

class HomeViewModel {
    var actionButtonTapped: (() -> Void)?
    let api: NetworkApiProtocol
    
    init(api: NetworkApiProtocol = Network()) {
        self.api = api
    }
    func actionButtonTappedAction() {
        actionButtonTapped?()
    }
    
    func fetchListNodes(_ completion: @escaping (RequestError?) -> Void) {
        api.fetchListNodes { _ , error in
            guard error == nil else {
                completion(error)
                return
            }
            completion(error)
        }
    }
    
}
