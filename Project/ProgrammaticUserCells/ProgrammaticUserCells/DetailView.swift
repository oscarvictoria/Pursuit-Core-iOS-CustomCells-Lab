//
//  DetailView.swift
//  ProgrammaticUserCells
//
//  Created by Oscar Victoria Gonzalez  on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    public lazy var userImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "person")
        return image
    }()
    
    public lazy var nameLabel: UILabel = {
        var name = UILabel()
        name.backgroundColor = .systemBlue
        name.text = "Name"
        name.textAlignment = .center
        return name
    }()
    
    public lazy var location: UILabel = {
        var location = UILabel()
        location.backgroundColor = .systemBlue
        location.textAlignment = .center
        location.text = "location"
        return location
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        configurUserImage()
        configureNameLabel()
        configureLacation()
    }
    
    func configurUserImage() {
        addSubview(userImage)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            userImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            userImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            userImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5)
            
        ])
    }
    
    func configureNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureLacation() {
        addSubview(location)
        location.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
             location.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
             location.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
             location.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
