//
//  NetworkRequestInvoker.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation
import Combine

final class NetworkRequestInvoker: Requester {
    func request<T>(_ request: NetworkRequest) throws -> AnyPublisher<T, NetworkError> where T : Decodable {
        guard let url = URL(string: request.url) else {
            return AnyPublisher(Fail<T, NetworkError>(error: NetworkError.badURL("ERROR: Invalid url!")))
        }
        return URLSession.shared.dataTaskPublisher(for: request.buildURLRequest(with: url))
            .tryMap { output in
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.serverError(code: 0, error: "ERROR: Server error")
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                NetworkError.invalidJSON("ERROR: \(String(describing: error))")
            }
            .eraseToAnyPublisher()
    }

    func request<T>(_ request: NetworkRequest) async throws -> AnyPublisher<T, NetworkError> where T : Decodable {
        guard let url = URL(string: request.url) else {
            return AnyPublisher(Fail<T, NetworkError>(error: NetworkError.badURL("ERROR: Invalid url!")))
        }
        return URLSession.shared.dataTaskPublisher(for: request.buildURLRequest(with: url))
            .tryMap { output in
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.serverError(code: 0, error: "ERROR: Server error")
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                NetworkError.invalidJSON("ERROR: \(String(describing: error))")
            }
            .eraseToAnyPublisher()
    }

}
