//
//  FetchExerciseVariationsUseCase.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import Foundation
import Combine

struct FetchExerciseVariationsUseCase: FetchExerciseVariationsUseCaseExecutor {
    let repository: ExerciseVariationsFetcher

    init(repository: ExerciseVariationsFetcher) {
        self.repository = repository
    }

    func execute(for variationsIDs: [Int]) async throws -> AnyPublisher<[ExerciseModel], NetworkError> {
        return await repository.fetchVariationsExercises(for: variationsIDs)
    }
}
