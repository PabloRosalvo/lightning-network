//
//  ListsNodes.swift
//  lightning-network
//
//  Created by Pablo Rosalvo de Melo Lopes on 24/06/24.
//


import Foundation

// MARK: - WelcomeElement
struct ListsNodes: Codable {
    let publicKey, alias: String
    let channels, capacity, firstSeen, updatedAt: Int
    let city: City?
    let country: Country?
    let isoCode, subdivision: String?

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
    let es, fr, ja, ptBR, ru, zhCN: String?

    enum CodingKeys: String, CodingKey {
        case de, en, es, fr, ja
        case ptBR = "pt-BR"
        case ru
        case zhCN = "zh-CN"
    }
}

// MARK: - Country
struct Country: Codable {
    let de, en, es, fr, ja, ptBR, ru, zhCN: String?

    enum CodingKeys: String, CodingKey {
        case de, en, es, fr, ja
        case ptBR = "pt-BR"
        case ru
        case zhCN = "zh-CN"
    }
}

typealias ListsNode = [ListsNodes]
