//
//  FetchExercisesUseCaseTests.swift
//  ExercisigmoTests
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import XCTest
@testable import Exercisigmo

final class FetchExercisesUseCaseTests: XCTestCase {

    var repository: ExercisesFetcher!
    var dataSource: ExercisesGetter!

    override func setUpWithError() throws {
        dataSource = ExerciseDataSourceMock()
        repository = ExercisesRepository(dataSource: dataSource)
    }

    func test_UseCaseExecuteFirstModel() async throws {
        let testModel = ExerciseModel(id: 1, name: "Exercise #1", description: "Exercise #1 Description", mainImageId: 10, mainImageUrl: URL(string: "https://i.imgur.com/R2ybTsP.png")!, allImages: [ExerciseImage(id: 10, image: URL(string: "https://i.imgur.com/R2ybTsP.png")!), ExerciseImage(id: 20, image: URL(string: "https://i.imgur.com/R2ybTsP.png")!)], variations: [3])


        let useCaseSubject = FetchExercisesUseCase(repository: repository)
        let spy = await ValueSpy(try useCaseSubject.execute())
        let firstSpy = spy.values.first?.first

        XCTAssertEqual(firstSpy!.name, testModel.name)
        XCTAssertEqual(firstSpy!.id, testModel.id)
        XCTAssertEqual(firstSpy!.description, testModel.description)
        XCTAssertEqual(firstSpy!.mainImageId, testModel.mainImageId)
        XCTAssertEqual(firstSpy!.allImages.count, 2)
        XCTAssertEqual(firstSpy!.allImages.first?.id, 10)
    }

    func test_UseCaseExecuteSecondModel() async throws {
        let testModel = ExerciseModel(id: 2, name: "Exercise #2", description: "Exercise #2 Description", mainImageId: 30, mainImageUrl: URL(string: "https://i.imgur.com/R2ybTsP.png")!, allImages: [ExerciseImage(id: 30, image: URL(string: "https://i.imgur.com/R2ybTsP.png")!), ExerciseImage(id: 40, image: URL(string: "https://i.imgur.com/R2ybTsP.png")!)], variations: [1])


        let useCaseSubject = FetchExercisesUseCase(repository: repository)
        let spy = await ValueSpy(try useCaseSubject.execute())
        let firstSpy = spy.values.first?[1]

        XCTAssertEqual(firstSpy!.name, testModel.name)
        XCTAssertEqual(firstSpy!.id, testModel.id)
        XCTAssertEqual(firstSpy!.description, testModel.description)
        XCTAssertEqual(firstSpy!.mainImageId, testModel.mainImageId)
        XCTAssertEqual(firstSpy!.allImages.count, 2)
        XCTAssertEqual(firstSpy!.allImages.first?.id, testModel.allImages.first?.id)
    }
}
