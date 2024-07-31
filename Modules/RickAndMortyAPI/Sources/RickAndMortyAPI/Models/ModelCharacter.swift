//
// ModelCharacter.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ModelCharacter: Codable, JSONEncodable, Hashable {

    public var id: Double?
    public var name: String?
    public var status: String?
    public var species: String?
    public var type: String?
    public var gender: String?
    public var origin: CharacterOrigin?
    public var location: CharacterOrigin?
    public var image: String?
    public var episode: [String]?
    public var url: String?
    public var created: String?

    public init(id: Double? = nil, name: String? = nil, status: String? = nil, species: String? = nil, type: String? = nil, gender: String? = nil, origin: CharacterOrigin? = nil, location: CharacterOrigin? = nil, image: String? = nil, episode: [String]? = nil, url: String? = nil, created: String? = nil) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case status
        case species
        case type
        case gender
        case origin
        case location
        case image
        case episode
        case url
        case created
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(species, forKey: .species)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(gender, forKey: .gender)
        try container.encodeIfPresent(origin, forKey: .origin)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(image, forKey: .image)
        try container.encodeIfPresent(episode, forKey: .episode)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(created, forKey: .created)
    }
}
