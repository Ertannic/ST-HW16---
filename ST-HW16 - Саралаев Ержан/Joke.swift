//
//  Model.swift
//  ST-HW16 - Саралаев Ержан
//
//  Created by Ertannic Saralay on 05.05.2024.
//

import Foundation


// MARK: - Cat
struct Cat: Codable {
    let cards: [Card]
}

// MARK: - Card
struct Card: Codable {
    let name, manaCost: String
    let type: String
    let setName: SetName
}

enum SetName: String, Codable {
    case tenthEdition = "Tenth Edition"
}
