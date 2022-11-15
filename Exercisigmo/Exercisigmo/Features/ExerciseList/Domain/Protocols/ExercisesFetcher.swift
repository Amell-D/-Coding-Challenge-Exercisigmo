//
//  ExercisesFetcher.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation
import Combine

protocol ExercisesFetcher {
    func fetchExercises() async -> AnyPublisher<[ExerciseModel], NetworkError>
}
