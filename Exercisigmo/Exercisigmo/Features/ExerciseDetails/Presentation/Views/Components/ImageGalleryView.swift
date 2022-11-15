//
//  ImageGalleryView.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import SwiftUI
import Kingfisher

struct ImageGalleryView: View {

    @State var allImages: [ExerciseImage]

    var body: some View {
        TabView {
            ForEach(allImages, id: \.id) { item in
                KFImage(item.image)
                    .resizable()
                    .background(Color.white)
                    .cornerRadius(16)
                    .padding(1)
                    .background(Color("PrimaryColor").cornerRadius(16))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 300)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .onAppear {
            setupAppearance()
        }
    }

    private func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "PrimaryColor")
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(named: "PrimaryColor")!.withAlphaComponent(0.5)
    }
}
