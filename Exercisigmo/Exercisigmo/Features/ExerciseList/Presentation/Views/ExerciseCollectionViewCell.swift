//
//  ExerciseCollectionViewCell.swift
//  Exercisigmo
//
//  Created by Amel Dizdarevic on 11/15/22.
//

import UIKit
import Kingfisher

class ExerciseCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 16
            imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    @IBOutlet weak var backgroundContainerView: UIView! {
        didSet {
            backgroundContainerView.layer.cornerRadius = 16
        }
    }
    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        clear()
    }

    private func clear() {
        imageView.image = UIImage()
        title.text = ""
    }

    func setup(exercise: ExerciseModel) {
        imageView.kf.setImage(with: exercise.mainImageUrl)
        title.text = exercise.name
        backgroundContainerView.backgroundColor = UIColor(named: "PrimaryColor")
    }
}
