//
//  PokemonViewModel.swift
//  PokeDex
//
//  Created by Eduardo Monroy Husillos on 3/8/25.
//

import Foundation
import SwiftUICore

class PokemonViewModel:ObservableObject {
    @Published var listPokemon = [PokemonModel] ()
    @Published var filteredPokemon = [PokemonModel] ()
    
    
    
    init(){
        getListPokemon()
    }
    
    func getListPokemon() {
        NetworkManager.shared.getListOfPokemon { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let listPokemon):
                    print ("listPokemon : \(listPokemon.count)")
                    self.listPokemon = listPokemon
                    self.filteredPokemon = listPokemon
                case .failure(let error):
                    print ("Error : \(error.localizedDescription)")
                }
            }
        }
    }
    
    func filterPokeom(name:String){
        if name.isEmpty{
            filteredPokemon = listPokemon
        } else {
            filteredPokemon = listPokemon.filter( {pokemon in
                pokemon.name.lowercased().contains(name.lowercased())
            })
        }
    }
    
    func getColorBasedOnType(type:String) -> Color{
        switch type {
        case "poison":
            return .purple
        case "fire":
            return .red
        case "water":
            return .blue
        case "bug","grass":
            return .green
        case "flying":
            return .mint
        case "normal":
            return .pink
        case "electric":
            return .yellow
        case "ground":
            return .brown
        case "fairy", "psychic", "dragon":
            return .orange
        case "fighting":
            return .gray
        case "ice","steel":
            return .teal
        default:
            return .white
        }
    }
}
