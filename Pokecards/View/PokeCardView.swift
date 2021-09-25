//
//  PokeCardView.swift
//  Pokecards
//
//  Created by Luis Mora Rivas on 25/9/21.
//

import SwiftUI

struct PokeCardView: View {
    // Variables
    private let gridItem = GridItem(.flexible(minimum: 80, maximum: 180))
    
    // Observed Variables
    @ObservedObject var pokemonCardViewModel = PokemonCardViewModel()
    
    // State Variables
    @State private var pokemonCardSearch = ""
    
    var filteredPokemonCard: [PokemonCard] {
        if pokemonCardSearch == "" {
            return pokemonCardViewModel.pokemonCard
        }
        pokemonCardViewModel.pokemonName = pokemonCardSearch
        return pokemonCardViewModel.pokemonCard.filter {
            $0.name.lowercased()
                .contains(pokemonCardSearch.lowercased())
        }
    }
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(.systemGray5))
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Buscar carta ...", text: $pokemonCardSearch)
                                .onChange(of: pokemonCardSearch, perform: {value in
                                    pokemonCardViewModel.fetchPokemonData(pokemon: pokemonCardSearch)
                                })
                        }
                        .foregroundColor(.gray)
                        .padding(.leading, 13)
                        
                    }
                    .frame(height: 40)
                    .cornerRadius(13)
                    .padding()
                    
                    if (pokemonCardViewModel.pokemonCard.count > 0) {
                        LazyVGrid (
                            columns: [gridItem, gridItem, gridItem],
                            alignment: .center,
                            spacing: 16) {
                                ForEach(pokemonCardViewModel.pokemonCard) { pokeCard in
                                    PokemonCardItemView(pokemonCard: pokeCard)
                                }
                            }
                    } else {
                        Text("No se encontro resultados")
                    }
                }
            }
            .navigationTitle("Pokemon Card List")
            
        }
    }
}

struct PokeCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokeCardView()
    }
}
