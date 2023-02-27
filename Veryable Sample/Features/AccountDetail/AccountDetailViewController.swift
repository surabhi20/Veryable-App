//
//  AccountDetailViewController.swift
//  Veryable Sample
//
//  Created by Surabhi Dhariwal on 2/24/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import UIKit

class AccountDetailViewController: UIViewController {
    
    //MARK: Public Variables
    var account: Account
    
    //MARK: Inits
    init(account: Account) {
        self.account = account
        super.init(nibName: nil, bundle: nil)
        self.title = "Details".uppercased()
    }
    
    required init?(coder: NSCoder) { nil }
    
    //MARK: Overrides
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ViewColor.background.color
        
        // Do any additional setup after loading the view.
        customView.doneButton.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)

        self.navigationController?.setupNavigationBar()
        
        self.setupStatusBar()
        self.setupAccountDetails()
    }
    
    //MARK: Lazy Loads
    private var customView = AccountDetailView()
   
    //MARK: Setup
    func setupAccountDetails(){
        customView.accountNameLabel.text = self.account.account_name
        customView.accountDescriptionLabel.text = self.account.desc
        
        let image = UIImage(named: self.account.account_type)?.withRenderingMode(.alwaysTemplate)
        customView.bankImageView.tintColor = VBlue.dark.color
        customView.bankImageView.image = image
    }
    
    //MARK: Button Press Action Method
    @objc func buttonPressed(_ sender:UIButton!)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
}
