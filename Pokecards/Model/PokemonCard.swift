//
//  PokemonCard.swift
//  Pokecards
//
//  Created by Luis Mora Rivas on 25/9/21.
//

import Foundation

struct PokemonResponse: Codable {
    let data: [PokemonCard]
}

struct PokemonImage: Codable {
    let small: String
    let large: String
}

struct PokemonCard: Codable, Identifiable {
    var id: String
    var name: String
    var images: PokemonImage
}

let MOCK_POKEMONIMAGE: PokemonImage = .init(
    small: "https://images.pokemontcg.io/gym2/2.png",
    large: "https://images.pokemontcg.io/gym2/2_hires.png"
)

let MOCK_POKEMONCARD: [PokemonCard] = [
    .init(id: "gym2-2", name: "Blaine's Charizard",images: MOCK_POKEMONIMAGE)
]
