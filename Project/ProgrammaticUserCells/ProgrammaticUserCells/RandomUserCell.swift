//
//  RandomUserCell.swift
//  ProgrammaticUserCells
//
//  Created by Oscar Victoria Gonzalez  on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit
import ImageKit


class RandomUserCell: UICollectionViewCell {
    
    var randomUser: User?
    
    @IBOutlet weak var randomUserImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    public func configured(for user: User) {
    nameLabel.text = user.name.first + " " + user.name.last
    locationLabel.text = user.location.state
    randomUserImage.getImage(with: user.picture.medium) { (result) in
        switch result {
        case .failure(let appError):
            print("app error \(appError)")
        case .success(let image):
            DispatchQueue.main.async {
                self.randomUserImage.image = image
            }
        }
    }
    }
    
}
