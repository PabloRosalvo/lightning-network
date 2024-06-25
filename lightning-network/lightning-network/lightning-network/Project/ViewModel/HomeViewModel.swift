//
//  HomeViewModel.swift
//  lightning-network
//
//  Created by Pablo Rosalvo de Melo Lopes on 24/06/24.
//

import Foundation

class HomeViewModel {
    var actionButtonTapped: (() -> Void)?
 
    func actionButtonTappedAction() {
        actionButtonTapped?()
    }
}
