//
//  ExercisesRepository.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation
import Combine

struct ExercisesRepository: ExercisesFetcher {
    let dataSource: ExercisesGetter

    init(dataSource: ExercisesGetter) {
        self.dataSource = dataSource
    }

    func fetchExercises() async -> AnyPublisher<[ExerciseModel], NetworkError> {
        return await dataSource.getExercises()
            .map(\.exercises)
            .map({ $0.map { transformExerciseEntityToModel($0) }})
            .eraseToAnyPublisher()
    }
}

extension ExercisesRepository: EntityToModelTranforming {
    private var placeholderImageString: String {
        "https://i.imgur.com/R2ybTsP.png"
    }

    func transformExerciseEntityToModel<T, E>(_ entity: E) -> T where T : Decodable, E : Decodable {
        let entity = entity as! ExerciseEntity
        return ExerciseModel(
            id: entity.id,
            name: entity.name ?? String("Exercise #\(entity.id)"),
            description: entity.description ?? "",
            mainImageId: extractMainImage(entity.images).id,
            mainImageUrl: extractMainImageUrl(extractMainImage(entity.images)),
            allImages: extractAllImages(entity),
            variations: entity.variations ?? []) as! T
    }

    func transformToSupplementaryImages<T, E>(_ images: [E]?) -> [T] where E: Decodable {
        let images = images as! [ExerciseEntityImage]
        let nonMainImages = images.filter({ $0.isMain == false })
        return nonMainImages.map({ ExerciseImage(id: $0.id, image: URL(string: $0.image ?? placeholderImageString))}) as! [T]
    }

    func extractMainImage<T>(_ images: [T]?) -> T {
        let images = images as! [ExerciseEntityImage]
        guard let mainImage = images.first(where: { $0.isMain })
        else {
            return ExerciseEntityImage(id: Int.random(in: 0...999), image: placeholderImageString, isMain: true) as! T
        }
        return mainImage as! T
    }

    func extractMainImageUrl<T>(_ mainImage: T) -> URL where T: Decodable {
        let mainImage = mainImage as! ExerciseEntityImage
        guard
            let urlString = mainImage.image,
            let mainImageUrl = URL(string: urlString)
        else {
            return URL(string: placeholderImageString)!
        }
        return mainImageUrl
    }

    func extractAllImages<T, E>(_ entity: E) -> [T] where E: Decodable {
        let entity = entity as! ExerciseEntity
        let mainEntityImage = extractMainImage(entity.images)
        let mainEntityImageUrl = extractMainImageUrl(mainEntityImage)
        let mainImage = ExerciseImage(id: mainEntityImage.id, image: mainEntityImageUrl)
        let supplementaryImages: [ExerciseImage] = transformToSupplementaryImages(entity.images)
        var allImages: [ExerciseImage] = []
        allImages.append(mainImage)
        allImages.append(contentsOf: supplementaryImages)
        return allImages as! [T]
    }
}
