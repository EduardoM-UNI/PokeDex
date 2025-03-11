//
//  PokemonModel.swift
//  PokeDex
//
//  Created by Eduardo Monroy Husillos on 3/8/25.
//

import Foundation

struct PokemonModel: Codable, Hashable {
    let id: Int
    let attack: Int
    let defense: Int
    let description: String
    let name: String
    let imageUrl: String
    let type: String
}
