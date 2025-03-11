//
//  PokemonViewModel.swift
//  PokeDex
//
//  Created by Eduardo Monroy Husillos on 3/8/25.
//

import Foundation

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
}
