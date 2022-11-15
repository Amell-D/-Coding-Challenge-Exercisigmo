//
//  VariationsComponentView.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import SwiftUI
import Kingfisher

struct VariationsComponentView: View {

    @Binding var variations: [ExerciseModel]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Variations:")
                .foregroundColor(Color("PrimaryColor"))
                .font(.headline)

            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(variations, id:\.id) { variation in
                        NavigationLink(destination: ExerciseVariationsView(exercise: variation)) {
                            HStack(alignment: .top, spacing: 15) {
                                KFImage(variation.mainImageUrl)
                                    .resizable()
                                    .background(Color.white)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(8)
                                    .padding(1)
                                    .background(Color("PrimaryColor").cornerRadius(8))
                                VStack(alignment: .leading) {
                                    Text(variation.name)
                                        .font(.headline)
                                    Text("Variation \(variation.id)")
                                        .font(.caption)
                                }
                                .padding(.top)
                                .foregroundColor(Color("PrimaryColor"))
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
        .padding()
    }
}
