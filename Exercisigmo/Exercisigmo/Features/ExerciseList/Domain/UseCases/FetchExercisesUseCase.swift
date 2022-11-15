//
//  FetchExercisesUseCase.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation
import Combine

struct FetchExercisesUseCase: FetchExercisesUseCaseExecutor {

    let repository: ExercisesFetcher

    init(repository: ExercisesFetcher) {
        self.repository = repository
    }

    func execute() async throws -> AnyPublisher<[ExerciseModel], NetworkError> {
        return await repository.fetchExercises()
    }
}
