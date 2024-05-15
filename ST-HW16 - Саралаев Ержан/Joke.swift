//
//  Model.swift
//  ST-HW16 - Саралаев Ержан
//
//  Created by Ertannic Saralay on 05.05.2024.
//

import Foundation

// MARK: - CardResponse
struct CardResponse: Codable {
    let cards: [Card]
}

// MARK: - Card
struct Card: Codable {
    let name: String
    let manaCost: String?
    let type: String
    let setName: String
}

enum SetName: String, Codable {
    case tenthEdition = "Tenth Edition"
}
