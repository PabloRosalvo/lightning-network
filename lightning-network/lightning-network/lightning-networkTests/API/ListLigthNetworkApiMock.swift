//
//  ListLigthNetworkApiMock.swift
//  lightning-networkTests
//
//  Created by Pablo Rosalvo de Melo Lopes on 25/06/24.
//

import Nimble
import Nimble_Snapshots
import Quick

@testable import lightning_network

final class ListRepositoryApiMock: NetworkApiProtocol {
    var shouldReturn: Bool = false
    init(shouldReturn: Bool) {
        self.shouldReturn = shouldReturn
    }
    func fetchListNodes(completion: @escaping (ListsNode?, RequestError?) -> Void) {
        let model: ListsNode? = JSONHelper.getObjectFrom(json: "list_ligthning_node", type: ListsNode?.self) ?? ListsNode()
        if shouldReturn {
            let model: ListsNode? = JSONHelper.getObjectFrom(json: "list_ligthning_node", type: ListsNode?.self) ?? ListsNode()
            completion(model, nil )
        } else {
            completion(nil, RequestError(reason: "Erro API" , statusCode: 500, data: nil))
        }
    }
}
