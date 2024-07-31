//
//  CharacterRM.swift
//  WBApp
//
//  Created by Назар Ткаченко on 30.07.2024.
//

import RickAndMortyAPI

struct CharacterRM {
    
    var characters: [ModelCharacter] = []
    
    init() {}
    
    mutating func loadCharacters(complete: @escaping (_ data: CharacterList?, _ error: Error?) -> Void) {
        CharacterAPI.characterGet { data, error in
            complete(data, error)
        }
    }
}

extension ModelCharacter: Identifiable {
    public var id: String {
        guard let urlString = url else {
            fatalError("url should never be nil")
        }
        return urlString
    }
}
