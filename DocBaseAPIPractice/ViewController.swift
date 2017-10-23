//
//  ViewController.swift
//  DocBaseAPIPractice
//
//  Created by jeon sangjun on 2017/10/20.
//  Copyright © 2017年 jeon sangjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    
    
    let request: Request = Request()
    
    @IBAction func groupListButton(_ sender: Any) {
        
        request.getGroupList()
        
        }
    
    @IBAction func memoListButton(_ sender: Any) {
        
        request.getMemoList()
    
    }
    
    @IBAction func memoSubmitButton(_ sender: Any) {
    
        
        guard let url = URL(string: "https://api.docbase.io/teams/docbaseapipractice/posts") else { return }
      
        let parameterDictionary: [String : Any] = [
            "title": titleTextField.text ?? "기본 제목",
            "body": bodyTextField.text ?? "기본 내용",
            "draft": false,
            "tags": ["abc", "123"],
            "scope": "group",
            "groups": [4713],
            "notice": true]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("beNCf4mxkKXLLRrBqEwH", forHTTPHeaderField: "X-DocBaseToken")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch {
                    print(error)
                }
            }
        }.resume()
    }

}


