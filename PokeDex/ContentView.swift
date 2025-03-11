//
//  ContentView.swift
//  PokeDex
//
//  Created by Eduardo Monroy Husillos on 3/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PokemonViewModel()
    
    private let numberOfColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: numberOfColumns){
                    ForEach(viewModel.filteredPokemon, id: \.self) { pokemon in
                        ZStack {
                            Rectangle()
                                .foregroundColor(viewModel.getColorBasedOnType(type: pokemon.type))
                                .cornerRadius(15)
                            VStack {
                                AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                .shadow(radius: 12)
                                
                                Text(pokemon.name)
                                    .font(.body)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }.padding(20)
            }
            .navigationBarTitle("Pokedex", displayMode:.inline)
        }
        
        
    }
}

#Preview {
    ContentView()
}
