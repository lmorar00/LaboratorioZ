//
//  PokemonCardViewModel.swift
//  Pokecards
//
//  Created by Luis Mora Rivas on 25/9/21.
//

import SwiftUI

class PokemonCardViewModel: ObservableObject {
    @Published var pokemonCard = [PokemonCard]()
    @Published var pokemonName: String = ""
    @Published var pageSize: Int = 20
    
    // API Urls
    var searchBaseUrl = "https://api.pokemontcg.io/v2/cards"
    
    init() {
        fetchPokemonData(pokemon: "")
    }
    
    func fetchPokemonData(pokemon: String) {
        searchBaseUrl = searchBaseUrl + "?pageSize=\(pageSize)"
        
        if (pokemon != "") {
            searchBaseUrl = searchBaseUrl + "&q=name:\(pokemon)"
        }
        
        guard let url = URL(string: searchBaseUrl) else {
            print("Your API end point is invalid")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(PokemonCardApiResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.pokemonCard = response.data
                    }
                    return
                }
            }
        }.resume()
    }
}
