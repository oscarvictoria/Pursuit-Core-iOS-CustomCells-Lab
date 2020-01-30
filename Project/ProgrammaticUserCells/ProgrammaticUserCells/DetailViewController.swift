//
//  DetailViewController.swift
//  ProgrammaticUserCells
//
//  Created by Oscar Victoria Gonzalez  on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var users: User?
    
    var detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        updateUI()
    }
    
    func updateUI() {
        guard let user = users else {
            fatalError("error, could not get user")
        }
        detailView.nameLabel.text = user.name.first + " " + user.name.last
        detailView.location.text = user.location.state
        detailView.userImage.getImage(with: user.picture.large) { (result) in
            switch result {
            case .failure(let appError):
                print("app error \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.detailView.userImage.image = image
                }
            }
        }
    }
    

}
