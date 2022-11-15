//
//  ExerciseDetailsView.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/14/22.
//

import SwiftUI
import Kingfisher

struct ExerciseDetailsView: View {

    @State var exercise: ExerciseModel
    @StateObject private var viewModel = ExerciseDetailsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                ImageGalleryView(allImages: exercise.allImages)
                Text(exercise.name)
                    .font(.largeTitle)
                    .foregroundColor(Color("PrimaryColor"))

                Rectangle()
                    .fill(Color("PrimaryColor"))
                    .frame(maxWidth: .infinity, maxHeight: 2)
                    .padding(.horizontal)

                VariationsComponentView(variations: $viewModel.variationsExercises)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("AccentColor").ignoresSafeArea())
            .navigationBarHidden(true)
            .onAppear {
                Task {
                    await viewModel.loadVariations(for: exercise.variations)
                }
            }
        }
    }
}

struct ExerciseDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailsView(exercise:
                                ExerciseModel(
                                    id: 1,
                                    name: "Bench BB Press",
                                    description: "",
                                    mainImageId: 1,
                                    mainImageUrl: URL(string: "https://wger.de/media/exercise-images/113/Walking-lunges-1.png")!,
                                    allImages: [
                                        ExerciseImage(id: 1, image: URL(string: "https://wger.de/media/exercise-images/113/Walking-lunges-1.png")!),
                                        ExerciseImage(id: 2, image: URL(string: "https://i.imgur.com/R2ybTsP.png")!),
                                        ExerciseImage(id: 3, image: URL(string: "https://wger.de/media/exercise-images/113/Walking-lunges-1.png")!)
                                    ],
                                    variations: []))
    }
}




