//
//  ExerciseVariationsFetcher.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import Foundation
import Combine

protocol ExerciseVariationsFetcher {
    func fetchVariationsExercises(for variationsIDs: [Int]) async -> AnyPublisher<[ExerciseModel], NetworkError>
}
