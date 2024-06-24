//
//  ListLigthNetworkViewModel.swift
//  lightning-network
//
//  Created by Pablo Rosalvo de Melo Lopes on 24/06/24.
//

import Foundation

final class ListLigthNetworkViewModel {
    enum TypeLanguage: String {
        case pt_br = "pt-BR"
        case en
    }
    private let api: NetworkApiProtocol
    private var model: [ListsNodes]?
    
    init(api: NetworkApiProtocol = Network()) {
        self.api = api
    }
    
    var modelList: [ListsNodes]? {
        return model
    }
    
    func amountOfBitcoin(_ indexPath: IndexPath) -> String {
        guard let capacity = modelList?[indexPath.row].capacity else { return ""}
        let btc = Double(capacity) / 100_000_000
        return String("Quantidade de Bitcoin que o node possui : \n \(btc) BTC")
    }
        
    func convertUnixTimefirstSeen(_ indexPath: IndexPath) -> String {
        guard let firstSeen = modelList?[indexPath.row].firstSeen else { return ""}
       return convertUnixTimeToDateValid(firstSeen)
    }
    
    func convertUnixTimeUpdatedAt(_ indexPath: IndexPath) -> String {
        guard let firstSeen = modelList?[indexPath.row].updatedAt else { return ""}
       return convertUnixTimeToDateValid(firstSeen)
    }
    
    func nameOfCity(_ indexPath: IndexPath) -> String? {
        guard let city = modelList?[indexPath.row].city else { return ""}
        guard let result = modelList?.contains(
            where: { $0.city?.ptBR == TypeLanguage.pt_br.rawValue }
        ) else { return city.en}
        return city.ptBR
    }
    
    
    func nameOfCountry(_ indexPath: IndexPath) -> String? {
        guard let country = modelList?[indexPath.row].country else { return ""}
        guard let result = modelList?.contains(
            where: { $0.country?.ptBR == TypeLanguage.pt_br.rawValue }
        ) else { return country.en }
        return country.ptBR
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
    
    func convertUnixTimeToDateValid(_ unixTime: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.init(abbreviation: "pt-BR")
        dateFormatter.locale = Locale.init(identifier: "pt-BR")
        dateFormatter.dateFormat = "E MMM d yyyy"
        let outputDate = dateFormatter.string(from: date)
        return outputDate
    }
    
}
