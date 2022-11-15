//
//  EntityToModelTranforming.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import Foundation

protocol EntityToModelTranforming {
    func transformExerciseEntityToModel<T, E>(_ entity: E) -> T where T: Decodable, E: Decodable
    func transformToSupplementaryImages<T, E>(_ images: [E]?) -> [T] where T: Decodable, E: Decodable
    func extractMainImage<T>(_ images: [T]?) -> T where T: Decodable
    func extractMainImageUrl<T>(_ mainImage: T) -> URL where T: Decodable
    func extractAllImages<T, E>(_ entity: E) -> [T] where E: Decodable, E: Decodable
}
