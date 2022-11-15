//
//  ExerciseModel.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation

struct ExerciseModel: Decodable {
    let id: Int
    let name: String
    let description: String
    let mainImageId: Int
    let mainImageUrl: URL
    let allImages: [ExerciseImage]
    let variations: [Int]
}

struct ExerciseImage: Decodable, Identifiable {
    let id: Int
    let image: URL?
}
