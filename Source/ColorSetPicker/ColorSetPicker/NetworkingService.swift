//
//  NetworkingService.swift
//  TodaySense
//
//  Created by 김태성 on 2023/02/16.
//

import Foundation

typealias RecommendColorSet = [String]
class NetworkingService {
    
    func requestGet(urlString: String, completionHandler: @escaping (Bool, Any?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(false, nil)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let defaultSession = URLSession(configuration: .default)
        
        defaultSession.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            guard error == nil else {
                completionHandler(false, nil)
                return
            }
            guard let data = data, let response = response as? HTTPURLResponse, (200..<300) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            
            guard let output = try? JSONDecoder().decode(RecommendColorSet.self, from: data) else {
                print("Error: JSON data parsing failed")
                return
            }
            
            completionHandler(true, output)
            
            
        }.resume()
        
    }
}
