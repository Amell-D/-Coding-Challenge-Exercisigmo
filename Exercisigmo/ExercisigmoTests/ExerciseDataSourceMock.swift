//
//  ExerciseDataSourceMock.swift
//  ExercisigmoTests
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import Foundation
import Combine
@testable import Exercisigmo

final class ExerciseDataSourceMock: ExercisesGetter {
    func getExercises() async -> AnyPublisher<Exercisigmo.ExercisesEntity, Exercisigmo.NetworkError> {
        Just(stub)
            .setFailureType(to: NetworkError.self)
            .eraseToAnyPublisher()
    }

    let stub = ExercisesEntity(exercises: [
        ExerciseEntity(
            id: 1, name: "Exercise #1", description: "Exercise #1 Description",
            images: [
            ExerciseEntityImage(id: 10, image: "https://i.imgur.com/R2ybTsP.png", isMain: true),
            ExerciseEntityImage(id: 20, image: "https://i.imgur.com/R2ybTsP.png", isMain: false)
            ],
            variations: [3]
        ),
        ExerciseEntity(
            id: 2, name: "Exercise #2", description: "Exercise #2 Description",
            images: [
                ExerciseEntityImage(id: 30, image: "https://i.imgur.com/R2ybTsP.png", isMain: true),
                ExerciseEntityImage(id: 40, image: "https://i.imgur.com/R2ybTsP.png", isMain: false)
            ],
            variations: [1]
        ),
        ExerciseEntity(
            id: 3, name: "Exercise #3", description: "Exercise #3 Description",
            images: [
                ExerciseEntityImage(id: 50, image: "https://i.imgur.com/R2ybTsP.png", isMain: true),
                ExerciseEntityImage(id: 60, image: "https://i.imgur.com/R2ybTsP.png", isMain: false)
            ],
            variations: [2]
        )
    ])
}
