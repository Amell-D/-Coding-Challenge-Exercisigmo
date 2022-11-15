//
//  ExerciseVariationsView.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import SwiftUI

struct ExerciseVariationsView: View {

    @Environment(\.presentationMode) var presentation
    @State var exercise: ExerciseModel

    var body: some View {
            VStack {
                ImageGalleryView(allImages: exercise.allImages)

                Text(exercise.name)
                    .font(.largeTitle)
                    .foregroundColor(Color("PrimaryColor"))

                Rectangle()
                    .fill(Color("PrimaryColor"))
                    .frame(maxWidth: .infinity, maxHeight: 2)
                    .padding(.horizontal)

                Spacer()

                Button {
                    presentation.wrappedValue.dismiss()
                } label: {
                    Text("Back")
                        .font(.title)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            Color("PrimaryColor")
                                .cornerRadius(16)
                        )
                        .padding()
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("AccentColor").ignoresSafeArea())
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden()
    }
}

struct ExerciseVariationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseVariationsView(exercise:
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
