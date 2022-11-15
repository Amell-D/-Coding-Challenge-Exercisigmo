//
//  Requester.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation
import Combine

protocol Requester {
    func request<T: Decodable>(_ request: NetworkRequest) async throws -> AnyPublisher<T, NetworkError>
    func request<T: Decodable>(_ request: NetworkRequest) throws -> AnyPublisher<T, NetworkError>
}
