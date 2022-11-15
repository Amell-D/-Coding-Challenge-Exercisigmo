//
//  ExerciseCollectionViewModel.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import Foundation
import Combine

final class ExerciseCollectionViewModel: ObservableObject {

    @Published var exercises: [ExerciseModel] = []

    let fetchExercisesUseCase: FetchExercisesUseCaseExecutor

    private var subscriptions = Set<AnyCancellable>()

    // Dependency injection could be handled better via Resolver
    init(fetchExercisesUseCase: FetchExercisesUseCaseExecutor = FetchExercisesUseCase(repository: ExercisesRepository(dataSource: ExercisesDataSource()))
    ) {
        self.fetchExercisesUseCase = fetchExercisesUseCase
        Task {
            await loadExercises()
        }
    }

    private func loadExercises() async {
        do {
            try await fetchExercisesUseCase.execute()
                .sink(receiveCompletion: { completion in
                    switch completion {
                        case .finished:
                            print("Exercises fetched succesfully!")
                        case .failure(let error):
                            // add some error variable to show
                            print("ERROR ALERT: \(error.localizedDescription)")
                    }
                }, receiveValue: { [weak self] values in
                    guard let self = self else { return }
                    self.exercises = values
                })
                .store(in: &subscriptions)
        } catch {
            print("ERROR ALERT: \(error.localizedDescription)")
        }
    }
}
