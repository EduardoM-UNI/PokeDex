//
//  PokemonDetailView.swift
//  PokeDex
//
//  Created by Eduardo Monroy Husillos on 3/11/25.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @State private var isAnimating = false
    
    let pokemon: PokemonModel
    var body: some View {
        VStack(spacing: 60) {
            AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(maxHeight: 200)
            .shadow(radius: 12)
            .scaleEffect(isAnimating ? 1.2 : 0.7)
            
            Text(pokemon.description)
                .font(.system(size: 28))
                .lineLimit(4)
            VStack(spacing: 10) {
                Text("Type: \(pokemon.type)")
                    .font(.title2)
            
                HStack{
                    Text("Attack: \(pokemon.attack)")
                        .foregroundColor(.red)
                    Text("Defense: \(pokemon.defense)")
                        .foregroundColor(.green)
                }
                .font(.title2)
                .bold()
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    isAnimating = true
                }
            }
        }
        .padding(15)
        .navigationTitle(pokemon.name)
        
    }
}

#Preview {
    PokemonDetailView(pokemon: MockData.pokemon)
}
