//
//  FetchExercisesUseCaseExecutor.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation
import Combine

protocol FetchExercisesUseCaseExecutor {
    func execute() async throws -> AnyPublisher<[ExerciseModel], NetworkError>
}
