//
//  ExercisesDataSource.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation
import Combine

final class ExerciseDetailsDataSource: ExerciseVariationsGetter {
    private let networkRequestInvoker: Requester

    init(networkRequestInvoker: Requester = NetworkRequestInvoker()) {
        self.networkRequestInvoker = networkRequestInvoker
    }

    func getExerciseVariationsByIds(for variationsIds: [Int]) async -> AnyPublisher<[ExerciseVariationsEntity], NetworkError> {
        Publishers.MergeMany(variationsIds.map({getExerciseVariationById(for: $0)}))
            .collect()
            .eraseToAnyPublisher()
    }

    private func getExerciseVariationById(for variationId: Int) -> AnyPublisher<ExerciseVariationsEntity, NetworkError> {
        let endpoint = Endpoints.getVariationsExercises(id: variationId)
        let request = endpoint.createRequest()
        do {
            return try networkRequestInvoker.request(request)
        } catch {
            return AnyPublisher(Fail<ExerciseEntity, NetworkError>(error: NetworkError.thrownError(error: error.localizedDescription)))
        }
    }
}
