//
//  AccountCell.swift
//  Veryable Sample
//
//  Created by Surabhi Dhariwal on 2/24/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import UIKit
import SnapKit

class AccountCell: UITableViewCell {
    
    //MARK: Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func setupConstraints() {
        
        bankImageView.snp.makeConstraints{
            $0.left.equalToSuperview().offset(10)
            $0.width.equalTo(25)
            $0.height.equalTo(25)
            $0.top.equalToSuperview().offset(20)
        }
        
        arrowImageView.snp.makeConstraints{
            $0.right.equalToSuperview().offset(-10)
            $0.width.equalTo(25)
            $0.height.equalTo(25)
            $0.centerY.equalToSuperview()
        }
        
        accountNameLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(50)
            $0.right.equalToSuperview().offset(-10)
            $0.height.equalTo(20)
            $0.top.equalToSuperview().offset(10)
        }
        
        accountDescriptionLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(50)
            $0.right.equalToSuperview().offset(-10)
            $0.height.equalTo(20)
            $0.top.equalToSuperview().offset(30)
        }
        
        accountTypeLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(50)
            $0.right.equalToSuperview().offset(-10)
            $0.height.equalTo(20)
            $0.top.equalToSuperview().offset(50)
        }
    }
    
    //MARK: Lazy Loads
    private lazy var accountNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = VGrey.dark.color
        label.font = .vryAvenirNextDemiBold(14)
        addSubview(label)
        return label
    }()
    
    private lazy var accountDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = VGrey.dark.color
        label.font = .vryAvenirNextRegular(12)
        addSubview(label)
        return label
    }()
    
    private lazy var accountTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = VGrey.normal.color
        label.font = .vryAvenirNextRegular(12)
        addSubview(label)
        return label
    }()
    
    private lazy var bankImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        return imageView
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        let image = UIImage(named: "arrow")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = VGrey.dark.color
        imageView.image = image
        addSubview(imageView)
        return imageView
    }()
    
    //MARK: Cell Helper Functions
    func configureCell(account: Account){
        accountNameLabel.text = account.account_name
        accountDescriptionLabel.text = account.desc
        if account.account_type == AccountType.bank.rawValue {
            accountTypeLabel.text = VString.bankAccountType
        }
        else{
            accountTypeLabel.text = VString.cardAccountType
        }
        configureCellImage(account)
    }
    
    func configureCellImage(_ account: Account){
        let image = UIImage(named: account.account_type)?.withRenderingMode(.alwaysTemplate)
        bankImageView.tintColor = VBlue.dark.color
        bankImageView.image = image
    }
    
}
