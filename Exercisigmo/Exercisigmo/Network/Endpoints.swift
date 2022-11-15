//
//  Endpoints.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation

public typealias Headers = [String: String]

enum Endpoints {

    // MARK: List of endpoints
    case getExercises
    case getVariationsExercises(id: Int)

    // MARK: HTTP Methods (can be extended to cover POST, PUT and DELETE)
    var httpMethod: HTTPMethod {
        switch self {
            case .getExercises, .getVariationsExercises:
                return .GET
        }
    }

    func createRequest() -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"] = "application/json"
        return NetworkRequest(url: getURL(), headers: headers, httpMethod: httpMethod)
    }

    // MARK: URLs of the endpoints
    func getURL() -> String {
        let baseUrl = "https://wger.de/api/v2"
        switch self {
            case .getExercises:
                return "\(baseUrl)/exerciseinfo/"
            case .getVariationsExercises(let id):
                return "\(baseUrl)/exerciseinfo/\(id)"
        }
    }
}
