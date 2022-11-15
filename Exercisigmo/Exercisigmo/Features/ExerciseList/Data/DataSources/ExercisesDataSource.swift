//
//  ExercisesDataSource.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation
import Combine

final class ExercisesDataSource: ExercisesGetter {
    private let networkRequestInvoker: Requester

    init(networkRequestInvoker: Requester = NetworkRequestInvoker()) {
        self.networkRequestInvoker = networkRequestInvoker
    }

    func getExercises() async -> AnyPublisher<ExercisesEntity, NetworkError> {
        let endpoint = Endpoints.getExercises
        let request = endpoint.createRequest()
        do {
            return try await networkRequestInvoker.request(request)
        } catch {
            return AnyPublisher(Fail<ExercisesEntity, NetworkError>(error: NetworkError.thrownError(error: error.localizedDescription)))
        }
    }
}
