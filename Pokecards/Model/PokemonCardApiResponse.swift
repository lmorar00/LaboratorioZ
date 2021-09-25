//
//  PokemonCardApiResponse.swift
//  Pokecards
//
//  Created by Luis Mora Rivas on 25/9/21.
//

import Foundation

struct PokemonCardApiResponse : Decodable {
    var data: [PokemonCard]
    var page: Int
    var pageSize: Int
    var count: Int
    var totalCount: Int
}
