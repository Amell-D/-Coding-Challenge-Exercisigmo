//
//  ExerciseEntity.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation

struct ExerciseEntity: Decodable {
    let id: Int
    let name: String?
    let description: String?
    let images: [ExerciseEntityImage]?
    let variations: [Int]?
}

struct ExerciseEntityImage: Decodable {
    let id: Int
    let image: String?
    let isMain: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case image
        case isMain = "is_main"
    }
}
