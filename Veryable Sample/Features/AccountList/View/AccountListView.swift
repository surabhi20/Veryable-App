//
//  AccountListView.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

//MARK: AccountListDelegate
protocol AccountListDelegate: AnyObject {
    func onFetchCompleted()
    func onFetchFailed(with reason: String)
}

class AccountListView: UIView {

    //MARK: Inits
    init(delegate: AccountListDelegate) {
        self.del = delegate
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) { nil }

    private func setup() {
        backgroundColor = ViewColor.background.color
        constrain()
    }

    private func constrain() {
        accountsTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    //MARK: Private members
    private weak var del: AccountListDelegate?

    //MARK: Lazy Loads
    
    public lazy var accountsTableView: UITableView = {
        let accountTableView = UITableView(frame: .zero)
        addSubview(accountTableView)
        return accountTableView
    }()
}
