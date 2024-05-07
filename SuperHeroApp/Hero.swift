//
//  Hero.swift
//  SuperHeroApp
//
//  Created by Arunima Das on 2023-08-20.
//

import Foundation
struct powerstats: Codable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}
struct biography: Codable {
    let full_name: String
    let alter_egos: String
    let aliases: Array<String>
    let place_of_birth: String
    let first_appearance: String
    let publisher: String
    let alignment: String
    enum CodingKeys: String, CodingKey {
        case full_name = "full-name"
        case alter_egos = "alter-egos"
        case aliases
        case place_of_birth = "place-of-birth"
        case first_appearance = "first-appearance"
        case publisher
        case alignment
        }
}
struct appearance: Codable {
    let gender: String
    let race: String
    let height: Array<String>
    let weight: Array<String>
    let eye_color: String
    let hair_color: String
    enum CodingKeys: String, CodingKey {
        case gender
        case race
        case height
        case weight
        case eye_color = "eye-color"
        case hair_color = "hair-color"
    }
}
struct connections: Codable {
    let group_affiliation: String
    let relatives: String
    enum CodingKeys: String, CodingKey {
        case group_affiliation = "group-affiliation"
        case relatives
    }
}
struct work: Codable {
    let occupation: String
    let base: String
}
struct image: Codable {
    let url: String
}
struct hero: Codable {
    var name: String
    var powerstats: powerstats
    var biography: biography
    var appearance: appearance
    var work: work
    var connections: connections
    var image: image
}
class PhotoCollection : Codable {
    var photos: [photoData] = []
}
class photoData: Codable {
    var id: String
    var name: String
    var image: String

    init(id: String, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}
