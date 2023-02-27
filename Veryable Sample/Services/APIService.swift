//
//  APIService.swift
//  Veryable Sample
//
//  Created by Surabhi Dhariwal on 2/23/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation

class APIService: APIServiceProtocol{
    
    // MARK: - Network Call
    func callService<T:Decodable>(urlString: String, success: @escaping((T)->Void), fail: @escaping((APIError?)->Void)){
        
        guard let url = URL(string: urlString) else{
            return
        }
        
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { data, response , error in
            guard error == nil else{
                fail(.requestFailed)
                return
            }
            
            guard let data = data else{
                fail(.invalidData)
                return
            }
            
            do{
               let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                success(decodedData)
                
            }
            catch {
                fail(.jsonParsingFailure)
                return
            }
        }
        task.resume()
    }
}
