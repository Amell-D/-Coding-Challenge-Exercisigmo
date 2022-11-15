//
//  ExerciseVariationsGetter.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import Foundation
import Combine

protocol ExerciseVariationsGetter {
    func getExerciseVariationsByIds(for variationsIds: [Int]) async -> AnyPublisher<[ExerciseEntity], NetworkError>
}
