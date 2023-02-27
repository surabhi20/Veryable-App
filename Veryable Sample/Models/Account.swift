//
//  Account.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation

typealias Accounts = [Account]

// MARK: - Account
struct Account : Decodable {
    let id: Int
    let account_type: String
    let account_name: String
    let desc: String
}
