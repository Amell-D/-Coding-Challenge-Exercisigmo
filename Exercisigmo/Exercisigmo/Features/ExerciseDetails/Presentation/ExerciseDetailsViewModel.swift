//
//  ExerciseDetailsViewModel.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import Foundation
import Combine

final class ExerciseDetailsViewModel: ObservableObject {

    @Published var variationsExercises: [ExerciseModel] = []

    let fetchExerciseVariationsUseCase: FetchExerciseVariationsUseCaseExecutor

    private var subscriptions = Set<AnyCancellable>()

    init(fetchExerciseVariationsUseCase: FetchExerciseVariationsUseCaseExecutor = FetchExerciseVariationsUseCase(repository: ExerciseDetailsRepository(dataSource: ExerciseDetailsDataSource()))) {
        self.fetchExerciseVariationsUseCase = fetchExerciseVariationsUseCase
    }

    func loadVariations(for variationsIDs: [Int]) async {
        do {
            try await fetchExerciseVariationsUseCase.execute(for: variationsIDs)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                        case .finished:
                            print("Exercise variations fetched succesfully!")
                        case .failure(let error):
                            print("ERROR ALERT: \(error)")
                    }
                }, receiveValue: { [weak self] values in
                    guard let self = self else { return }
                    self.variationsExercises = values
                })
                .store(in: &subscriptions)
        } catch {
            print("ERROR ALERT: \(error)")
        }
    }
}
