//
//  AccountRepo.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation

class AccountRepo {
    
    //MARK: Private members
    private let apiService: APIService
    
    //MARK: Inits
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    //MARK: Public Methods
    public func getAccountList(success: @escaping((Accounts)->Void), fail: @escaping((APIError)->Void)) {
        
        apiService.callService(urlString: "https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json") { (response:Accounts) in
            success(response)
        } fail: { error in
            fail(error!)
        }

    }
}
