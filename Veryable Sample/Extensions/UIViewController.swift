//
//  UIViewController.swift
//  Veryable Sample
//
//  Created by Surabhi Dhariwal on 2/25/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import UIKit
import SnapKit

// MARK: - UIViewController Extension to setup status bar appearance
extension UIViewController {
    
    var statusBarHeight: CGFloat {
        guard
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let height = scene.statusBarManager?.statusBarFrame.height
        else {
            return 0
        }
        return height
    }
    
    func setupStatusBar(){
        
        if #available(iOS 13.0, *) {
            let statusBarHeight: CGFloat = self.statusBarHeight
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = ViewColor.surface.color
            view.addSubview(statusbarView)
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            
            statusbarView.snp.makeConstraints{
                $0.height.equalTo(statusBarHeight)
                $0.width.equalToSuperview()
                $0.top.equalToSuperview()
                $0.centerX.equalToSuperview()
            }
          
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = ViewColor.surface.color
        }
        
    }
    
    
}
