//
//  ValueSpy.swift
//  ExercisigmoTests
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import Foundation
import Combine
@testable import Exercisigmo

class ValueSpy<T> where T:Decodable {
    private(set) var values = [T]()
    private var cancelablle: AnyCancellable?

    init(_ publisher: AnyPublisher<T, NetworkError>) {
        cancelablle = publisher.sink(receiveCompletion: { completion in
            print(completion)
        }, receiveValue: { value in
            self.values.append(value)
        })
    }
}
