//
//  ListsNodes.swift
//  lightning-network
//
//  Created by Pablo Rosalvo de Melo Lopes on 24/06/24.
//

import Foundation

struct ListsNodes: Codable {
    let publicKey: String
    let alias: String
    let channels: Int
    let capacity: Int
    let firstSeen: Int
    let updatedAt: Int
    let city: City
    let country: City?
    let isoCode: String
    let subdivision: String?
    
    enum CodingKeys: String, CodingKey {
        case publicKey, alias, channels, capacity, firstSeen, updatedAt, city, country
        case isoCode = "iso_code"
        case subdivision
    }
}

// MARK: - City
struct City: Codable {
    let de: String?
    let en: String
    let es, fr, ja, ptBR: String?
    let ru, zhCN: String?

    enum CodingKeys: String, CodingKey {
        case de, en, es, fr, ja
        case ptBR = "pt-BR"
        case ru
        case zhCN = "zh-CN"
    }
}
