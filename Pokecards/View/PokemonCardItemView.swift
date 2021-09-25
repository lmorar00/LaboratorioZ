//
//  PokemonCardItemView.swift
//  Pokecards
//
//  Created by Luis Mora Rivas on 25/9/21.
//

import SwiftUI
import Kingfisher

struct PokemonCardItemView: View {
    // Variables
    let pokemonCard: PokemonCard
    
    init(pokemonCard: PokemonCard) {
        self.pokemonCard = pokemonCard
    }
    
    var body: some View {
        ZStack (alignment: .topTrailing){
            VStack (alignment: .leading, spacing: 0) {
                KFImage(URL(string: pokemonCard.images.small))
                    .resizable()
                    .aspectRatio(CGSize(width: 600, height: 825), contentMode: .fit)
                    .clipped()
            
                VStack (alignment: .leading, spacing: 0) {
                        Text(pokemonCard.name)
                            .font(.system(size: 18, weight: .bold))
                            .lineLimit(1)
                    }
               
                    
            }
        }
    }
}

struct PokemonCardItemView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardItemView(pokemonCard: MOCK_POKEMONCARD[0])
    }
}
