//
//  APIService.swift
//  newsDemo
//
//  Created by Hrishav on 29/7/21.
//

import Foundation

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "https://saurav.tech/NewsAPI/top-headlines/category/health/in.json")!
    
    func apiToGetEmployeeData(completion : @escaping (MainModel) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let newsData = try! jsonDecoder.decode(MainModel.self, from: data)
                    completion(newsData)
                print(newsData)
            }
        }.resume()
    }
    
    func apiToGetNewsData(completion : @escaping (_ MainModel: Int) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let newsData = try! jsonDecoder.decode(MainModel.self, from: data)
                completion(newsData.articles!.count)
                print(newsData)
            }
        }.resume()
    }
}
