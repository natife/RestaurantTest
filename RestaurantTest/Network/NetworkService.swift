//
//  NetworkService.swift
//  RestaurantTest
//
//  Created by Natife on 5/20/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import Foundation

class NetworkService
{
    private let session = URLSession.shared
    
    @discardableResult
    func getFeed(_ completion: @escaping ([Feed]) -> ()) -> URLSessionDataTask
    {
        var request = URLRequest(url: URL(string: Network.endpoint.dataEndpoint)!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = session.dataTask(with: request)
        { (data, _, error) in
            if let error = error
            {
                debugPrint(error.localizedDescription)
                completion([])
                return
            }
            
            guard let data = data, let response = try? JSONDecoder().decode([Feed].self, from: data) else
            {
                completion([])
                return
            }
            completion(response)
        }
        task.resume()
        return task
    }
}
