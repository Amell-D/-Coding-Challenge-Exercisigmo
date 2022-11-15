//
//  FetchExerciseVariationsUseCaseExecutor.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import Foundation
import Combine

protocol FetchExerciseVariationsUseCaseExecutor {
    func execute(for variationsIDs: [Int]) async throws -> AnyPublisher<[ExerciseModel], NetworkError>
}
