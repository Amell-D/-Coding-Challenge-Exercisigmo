//
//  ExercisesCollectionViewController.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import UIKit
import Combine
import SwiftUI

class ExercisesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private var viewModel = ExerciseCollectionViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        viewModel.$exercises
            .receive(on: DispatchQueue.main)
            .sink { [weak self] items in
                self?.collectionView.reloadData()
            }
            .store(in: &subscriptions)

    }

    private func setupCollectionView() {
        collectionView.collectionViewLayout = collectionViewLayoutSetUp()
        collectionView.backgroundColor = UIColor(named: "AccentColor")
        setupNavigationAppeareance()
        registerCells()
    }

    private func setupNavigationAppeareance() {
        self.title = "Exercisizimo Database"
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(named: "PrimaryColor")!,
            .font: UIFont(name: "Helvetica", size: 24)!]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }

    private func registerCells() {
        self.collectionView.register(UINib(nibName: ReuseableIdentifiers.exerciseCell.rawValue, bundle: .main), forCellWithReuseIdentifier: ReuseableIdentifiers.exerciseCell.rawValue)
    }

    private func collectionViewLayoutSetUp() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        return layout
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.exercises.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseableIdentifiers.exerciseCell.rawValue, for: indexPath) as? ExerciseCollectionViewCell,
            let exercise =  viewModel.exercises[safe: indexPath.row]
        else { return UICollectionViewCell() }
        cell.setup(exercise: exercise)
        return cell
    }

    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/2) - 10 - 10, height: (view.frame.size.width/2) - 10 - 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let exercise =  viewModel.exercises[safe: indexPath.row] else { return }
        let viewController = UIHostingController(rootView: ExerciseDetailsView(exercise: exercise))
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
