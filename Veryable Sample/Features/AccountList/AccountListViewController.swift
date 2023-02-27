//
//  AccountListViewController.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit

class AccountListViewController: UIViewController {
    
    //MARK: Inits
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Accounts".uppercased()
        self.navigationItem.title = "Accounts".uppercased()
    }
    required init?(coder: NSCoder) { nil }
    
    //MARK: Private members
    private var viewModel: AccountVM!
    private let cellId = "AccountCell"
    private let cellHeight = 80.0
    
    //MARK: Lazy Loads
    private lazy var customView: AccountListView = {
        AccountListView(delegate: self)
    }()
    
    //MARK: Overrides
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        //Setup Views
        setupTableView()
        self.navigationController?.setupNavigationBar()
        self.setupStatusBar()
        
        //Init ViewModel
        viewModel = AccountVM(delegate: self)
        viewModel.fetchAccounts()
        
        //Remove text from back button
        let backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    //MARK: Helper Functions
    func setupTableView(){
        customView.accountsTableView.register(AccountCell.self, forCellReuseIdentifier: cellId)
        customView.accountsTableView.dataSource = self
        customView.accountsTableView.delegate = self
        customView.accountsTableView.separatorColor = VGrey.dark.color
    }
}

// MARK: - AccountListDelegate
extension AccountListViewController: AccountListDelegate {
    
    func onFetchCompleted() {
        DispatchQueue.main.async {
            self.customView.accountsTableView.reloadData()
        }
    }
    
    func onFetchFailed(with reason: String) {
        let alert = UIAlertController(title: VString.errorString, message: reason, preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableView DataSource
extension AccountListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTotalCountInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? AccountCell else{
            return AccountCell()
        }
        
        // Setup Cell Separator Line
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.configureCell(account: viewModel.getAccount(at: indexPath.row, in: indexPath.section))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.totalSections
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.getSectionHeader(at: section)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = ViewColor.background.color
        let header = view as! UITableViewHeaderFooterView
        header.layer.borderWidth = 0.5
        header.layer.borderColor = VGrey.dark.color.cgColor
        header.textLabel?.textColor = VGrey.dark.color
        header.textLabel?.font = .vryAvenirNextDemiBold(16)
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return 50.0
    }
}

// MARK: - UITableView Delegate
extension AccountListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let account = viewModel.getAccount(at: indexPath.row, in: indexPath.section)
        tableView.deselectRow(at: indexPath, animated: false)
        let detailsVC = AccountDetailViewController(account: account)
        navigationController?.pushViewController(detailsVC, animated: true)
        
    }
    
}
