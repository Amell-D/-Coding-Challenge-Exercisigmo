//
//  NetworkRequest.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation

public struct NetworkRequest {
    let url: String
    let headers: [String: String]?
    let httpMethod: HTTPMethod

    public init(url: String,
                headers: [String: String]? = nil,
                httpMethod: HTTPMethod
    ) {
        self.url = url
        self.headers = headers
        self.httpMethod = httpMethod
    }

    func buildURLRequest(with url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers ?? [:]
        return urlRequest
    }
}

public enum HTTPMethod: String {
    case GET
}

public enum NetworkError: Error, Equatable {
    case badURL(_ error: String)
    case apiError(code: Int, error: String)
    case invalidJSON(_ error: String)
    case unauthorized(code: Int, error: String)
    case badRequest(code: Int, error: String)
    case serverError(code: Int, error: String)
    case noResponse(_ error: String)
    case unableToParseData(_ error: String)
    case thrownError(error: String)
}
