//
//  ExercisesEntity.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation

struct ExercisesEntity: Decodable {
    let exercises: [ExerciseEntity]

    enum CodingKeys: String, CodingKey {
        case exercises = "results"
    }
}
