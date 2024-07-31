//
//  RickAndMortyScreen.swift
//  WBApp
//
//  Created by Назар Ткаченко on 30.07.2024.
//

import SwiftUI

struct RickAndMortyScreen: View {

    @State var characters: CharacterRM = .init()

    var body: some View {
        ZStack {
            VStack {
                List(characters.characters) { person in
                    switch person.image {
                    case .some(let image):
                        CharacterCell(image: image, name: person.name ?? "")
                    case .none:
                        Text(person.name ?? "No Name")
                        Image(systemName: "person")
                    }
                }
            }
        }
        .onAppear {
            characters.loadCharacters { data, error in
                characters.characters = data?.results ?? []
            }
            print(characters)
        }
    }
}

#Preview {
    RickAndMortyScreen()
}
