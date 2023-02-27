//
//  AccountVM.swift
//  Veryable Sample
//
//  Created by Surabhi Dhariwal on 2/24/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation

class AccountVM{
    
    // MARK: - Private Variables
    private weak var delegate: AccountListDelegate?
    private var isFetchInProgress = false
    private var accounts: Accounts = []
    private var accountsDictionary = [String:[Account]]()
    
    // MARK: - Public Variables
    public var totalSections:Int{
        return accountsDictionary.keys.count
    }
    
    // MARK: - Initializer
    init(delegate: AccountListDelegate? = nil) {
        self.delegate = delegate
    }
    
    // MARK: - Helper functions
    func getSectionHeader(at index:Int)->String{
       
        let sortDictionaryKeys = accountsDictionary.keys.sorted(by: <)
        if sortDictionaryKeys[index] == AccountType.bank.rawValue {
            return "Bank Accounts"
        }
        else if sortDictionaryKeys[index] == AccountType.card.rawValue{
            return "Cards"
        }
        else {
            return ""
        }
    }
    
    func getTotalCountInSection(_ index:Int)->Int{
        
        let sortDictionaryKeys = accountsDictionary.keys.sorted(by: <)
        return accountsDictionary[sortDictionaryKeys[index]]!.count
        
    }
    
    func getAccount(at index:Int, in section:Int)->Account{
        let sortDictionaryKeys = accountsDictionary.keys.sorted(by: <)
        let accounts = accountsDictionary[sortDictionaryKeys[section]]!
        return accounts[index]
    }
    
    // Save accounts in a dictionary with account_type as key
    private func setupAccounts(){
        for account in accounts{
            let key = account.account_type
            var value = accountsDictionary[key]
            if value == nil {
                value = [account]
            } else {
                value?.append(account)
            }
            accountsDictionary[key] = value
        }
    }
    
    // MARK: - Network Call
    func fetchAccounts(){
        let accountRepo = AccountRepo(apiService: APIService())
        accountRepo.getAccountList {
            (response:Accounts) in
            self.accounts.append(contentsOf: response)
            self.setupAccounts()
            self.delegate?.onFetchCompleted()
            
        } fail: { error in
            self.delegate?.onFetchFailed(with: error.localizedDescription)
        }

    }
    
}
