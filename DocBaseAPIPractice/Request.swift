//
//  GropList.swift
//  DocBaseAPIPractice
//
//  Created by jeon sangjun on 2017/10/20.
//  Copyright © 2017年 jeon sangjun. All rights reserved.
//

import Foundation

class Request {
    
    enum MethodValue: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case patch = "PATCH"
        case delete = "DELETE"
    }
    
    let session: URLSession = URLSession.shared
    
    func requestValue(url: URL, httpMethod: MethodValue) -> URLRequest {
        
        let apiKey: String = "beNCf4mxkKXLLRrBqEwH"
        
        var request: URLRequest = URLRequest(url: url)
        
        request.httpMethod = httpMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(apiKey, forHTTPHeaderField: "X-DocBaseToken")
        
        return request
    }
    
    // GET METHOD
    func getGroupList() -> Void {
        
        guard let url = URL(string: "https://api.docbase.io/teams/docbaseapipractice/groups") else { return }
        
        let request = requestValue(url: url, httpMethod: .get)
        
        session.dataTask(with: request) { (data, response, error) in
            //if let response = response {
              //  print(response)
            //}
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    
    // GET METHOD
    func getMemoList() -> Void {
        
        guard let url = URL(string: "https://api.docbase.io/teams/docbaseapipractice/posts?q=group:Board") else { return }
        
        var request: URLRequest = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("beNCf4mxkKXLLRrBqEwH", forHTTPHeaderField: "X-DocBaseToken")
        session.dataTask(with: request) { (data, response, error) in
            //if let response = response {
            //  print(response)
            //}
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    
    // DELETE METHOD
    func delete(num: String) -> Void {
    
        
        guard let url = URL(string: "https://api.docbase.io/teams/docbaseapipractice/posts/\(num)") else { return }
        
        var request: URLRequest = URLRequest(url: url)
        
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("beNCf4mxkKXLLRrBqEwH", forHTTPHeaderField: "X-DocBaseToken")
        session.dataTask(with: request) { (data, response, error) in
            //if let response = response {
            //  print(response)
            //}
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
    
    
//    // POST METHOD
//    func postSubmitMemo(body: [String : Any]) throws {
//
//        guard let url = URL(string: "https://api.docbase.io/teams/docbaseapipractice/posts") else { return }
//
//        var request: URLRequest = URLRequest(url: url)
//
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("beNCf4mxkKXLLRrBqEwH", forHTTPHeaderField: "X-DocBaseToken")
//        request.httpBody = try JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions.prettyPrinted)
//
//        session.dataTask(with: request) { (data, response, error) in
//            if let response = response {
//                print(response)
//            }
//            if let data = data {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print(json)
//                }catch {
//                    print(error)
//                }
//            }
//        }.resume()
//    }
    
    
}
