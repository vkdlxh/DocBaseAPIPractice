//
//  ParsePost.swift
//  DocBaseAPIPractice
//
//  Created by jeon sangjun on 2017/10/25.
//  Copyright © 2017年 jeon sangjun. All rights reserved.
//

import Foundation

struct ParsePost {
    
    let id: Int
    let title: String
    let body: String
    let draft: Bool
    let url: String
    let created_at: String
    var tags =  [Tag]()     //宣言しながらインスタンス生成しておく
    let scope: String
//    let groups: Group
    let user: User
//    let comments: Comment
    
    init?(dict: [String: Any]) {
        
        guard let id = dict["id"] as? Int else { return nil }
        guard let title = dict["title"] as? String else { return nil }
        guard let body = dict["body"] as? String else { return nil }
        guard let draft = dict["draft"] as? Bool else { return nil }
        guard let url = dict["url"] as? String else { return nil }
        guard let created_at = dict["created_at"] as? String else { return nil }
        
        if let items = dict["tags"] as? [[String: Any]] {

            for item in items {
                
                if let tag = Tag(tag:item) {
                    //配列で保存
                    tags.append(tag)
                }
            }
        } else { return nil }
        
//        guard let tags = Tag(dict: tagDict) else { return nil }
        guard let scope = dict["scope"] as? String else { return nil }
        guard let groupDict = dict["groups"] as? [Any] else { return nil }
//        guard let groups = Group(dict: groupDict) else { return nil }
        guard let userDict = dict["user"] as? [String: Any] else { return nil }
        guard let user = User(dict: userDict) else { return nil }
        guard let commentDict = dict["comments"] as? [Any] else { return nil }
//        guard let comments = Comment(dict: commentDict) else { return nil }
        
        self.id = id
        self.title = title
        self.body = body
        self.draft = draft
        self.url = url
        self.created_at = created_at
//        self.tags = tag
        self.scope = scope
//        self.groups = groups
        self.user = user
//        self.comments = comments
    }
    
    struct Tag {
        var name: String
        
        init?(tag: [String: Any]) {
            guard let name = tag["name"] as? String else { return nil }
    
            self.name = name
        }
    }
    
//    struct Group {
//        let id: Int
//        let name: String
//
//        init?(dict: [String: Any]) {
//            guard let id = dict["id"] as? Int else { return nil }
//            guard let name = dict["name"] as? String else { return nil }
//
//            self.id = id
//            self.name = name
//        }
//    }
    
    struct User {
        let id: Int
        let name: String
        let profile_image_url: String
        
        init?(dict: [String: Any]) {
            guard let id = dict["id"] as? Int else { return nil }
            guard let name = dict["name"] as? String else { return nil }
            guard let profile_image_url = dict["profile_image_url"] as? String else { return nil }
            
            self.id = id
            self.name = name
            self.profile_image_url = profile_image_url
            
        }
    }
    
//    struct Comment {
//        let id: Int
//        let body: String
//        let created_at: String
//        let user: User?
//
//        init?(dict: [String: Any]) {
//            guard let id = dict["id"] as? Int else { return nil }
//            guard let body = dict["body"] as? String else { return nil }
//            guard let created_at = dict["created_at"] as? String else { return nil }
//            guard let userDict = dict["user"] as? [String: Any] else { return nil }
//            guard let user = User(dict: userDict) else { return nil }
//
//            self.id = id
//            self.body = body
//            self.created_at = created_at
//            self.user = user
//        }
//    }
}

