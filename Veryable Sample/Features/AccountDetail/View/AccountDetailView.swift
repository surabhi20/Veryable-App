//
//  AccountDetailView.swift
//  Veryable Sample
//
//  Created by Surabhi Dhariwal on 2/24/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import UIKit
import SnapKit

class AccountDetailView: UIView {
    
    //MARK: Inits
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }

    private func setup() {
        setupConstraints()
    }

    private func setupConstraints() {
        
        bankImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(140)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(90)
            $0.height.equalTo(90)
        }
        
        accountNameLabel.snp.makeConstraints {
            $0.top.equalTo(bankImageView).offset(110)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        accountDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(accountNameLabel).offset(25)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        doneButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-50)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview().offset(-30)
        }
    }

    //MARK: Lazy Loads
    public lazy var bankImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        return imageView
    }()
    
    public lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = VGrey.dark.color
        label.font = .vryAvenirNextDemiBold(16)
        addSubview(label)
        return label
    }()
    
    public lazy var accountDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = VGrey.dark.color
        label.font = .vryAvenirNextRegular(14)
        addSubview(label)
        return label
    }()
    
    public lazy var doneButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.backgroundColor = VBlue.dark.color
        button.setTitle("DONE", for: UIControl.State.normal)
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 3.0
        button.titleLabel?.font = .vryAvenirNextDemiBold(16)
        
        button.layer.shadowColor = VGrey.dark.color.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 2.0
        
        addSubview(button)
        return button
    }()
    
    
    
   
}
