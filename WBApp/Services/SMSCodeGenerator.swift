//
//  SMSCodeGenerator.swift
//  WBApp
//
//  Created by Назар Ткаченко on 15.07.2024.
//

struct SMSCodeGenerator: Sequence {
    private let length: Int
    private let characters: [Character]

    init(length: Int = 4) { // По умолчанию длина 4
        self.length = length
        self.characters = Array("0123456789")
    }

    func makeIterator() -> CodeGeneratorIterator {
        return CodeGeneratorIterator(length: length, characters: characters)
    }
}

struct CodeGeneratorIterator: IteratorProtocol {
    private let length: Int
    private let characters: [Character]
    private var generated = false

    init(length: Int, characters: [Character]) {
        self.length = length
        self.characters = characters
    }

    mutating func next() -> String? {
        guard !generated else { return nil }
        generated = true
        return String((0..<length).compactMap { _ in characters.randomElement() })
    }
}
