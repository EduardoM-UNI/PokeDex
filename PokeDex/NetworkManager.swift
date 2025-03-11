//
//  NetworkManager.swift
//  PokeDex
//
//  Created by Eduardo Monroy Husillos on 3/8/25.
//

import Foundation

enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}


class NetworkManager {
    static let shared = NetworkManager()
    static let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init () {}
    
    func getListOfPokemon(completed: @escaping (Result<[PokemonModel], APError>) -> Void){
        guard let url = URL(string: NetworkManager.baseUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, _, error in
            
            guard let data = data?.parseData(removeString: "null,") else {
                completed(.failure(.decodingError))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([PokemonModel].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                print("Debug: error \(error.localizedDescription)")
                completed(.failure(.decodingError))
            }
        }
        task.resume()
    }
}

extension Data {
    
    func parseData(removeString word: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: word, with: "")
        guard let data = parseDataString?.data(using: .utf8) else {return nil}
        return data
    }
}

struct MockData {
    
    static let pokemon = PokemonModel(id: 123, attack: 50, defense: 35, description: "It seductively wiggles its hips as it walks. It can cause people to dance in unison with it.", name: "scyther", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2FA4390AE6-33EA-4F81-A08B-25F2979158FC?alt=media&token=a225cf16-515e-4b08-a4fe-58bdfaf506b4", type: "flying")
}
