//
//  PersonController.swift
//  FindACrew
//
//  Created by Aaron Cleveland on 1/14/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import Foundation

class PersonController {
    let baseUrl = URL(string: "https://swapi.co/api/people")!
    var people: [Person] = []
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    func searchForPeopleWith(searchTerm: String, completion: @escaping () -> Void ) {
        var urlComponents = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [searchTermQueryItem]
        guard let requestUrl = urlComponents?.url else {
            print("request URL is nil")
            completion()
            return
        }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = HTTPMethod.get.rawValue
        //https://swapi.co/api/people/?search=[search term]
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Erro fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data returned from data task.")
                return
            }
            
            let jsonDecorder = JSONDecoder()
            do {
                let personSearch = try jsonDecorder.decode(PersonSearch.self, from: data)
                self.people.append(contentsOf: personSearch.results)
            } catch {
                print("Unable to decode data into object of type [Person]: \(error)")
            }
            completion()
        }
        .resume()
    }
}
