//
//  AccountProtocols.swift
//  Veryable Sample
//
//  Created by Surabhi Dhariwal on 2/23/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation

// MARK: - APIServiceProtocol protocol for APIService for dependency injection
protocol APIServiceProtocol: AnyObject{
    
    func callService<T:Decodable>(urlString: String, success: @escaping((T)->Void), fail: @escaping((APIError?)->Void))
}
