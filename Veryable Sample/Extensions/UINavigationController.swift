//
//  UINavigationController.swift
//  Veryable Sample
//
//  Created by Surabhi Dhariwal on 2/25/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import UIKit

// MARK: - UINavigationController Extension to setup navigation bar appearance
extension UINavigationController
{
    func setupNavigationBar(){
        
        // Setup Navigation bar title font and color attributes
        let attributes = [NSAttributedString.Key.font: UIFont.vryAvenirNextRegular(18),NSAttributedString.Key.foregroundColor: VGrey.dark.color]
        navigationBar.titleTextAttributes = attributes
        
        // Setup bottom separator line of navigation bar
        navigationBar.layer.masksToBounds = false
        navigationBar.layer.shadowColor = VGrey.light.color.cgColor
        navigationBar.layer.shadowOpacity = 0.5
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        navigationBar.layer.shadowRadius = 0.5
        
        //Setup Colors
        navigationBar.tintColor = VGrey.dark.color
        navigationBar.backgroundColor = ViewColor.surface.color
       
    }
}
