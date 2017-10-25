//
//  ParseJSON.swift
//  DocBaseAPIPractice
//
//  Created by jeon sangjun on 2017/10/24.
//  Copyright © 2017年 jeon sangjun. All rights reserved.
//

import Foundation

struct ParseJSON {
    
//    let posts: Post
    let meta: Meta

    init?(dict: [String: Any]) {
        guard let postsDict = dict["title"] as? String else {
            print("Error postsDict")
            return nil
        }
//        guard let posts = Post(dict: postsDict) else {
//            print("Error posts")
//            return nil
//        }
        guard let metaDict = dict["meta"] as? [String: Any] else {
            print("Error metaDict")
            return nil
        }
        guard let meta = Meta(dict: metaDict) else {
            print("Error meta")
            return nil
        }
        
//        self.posts = posts
        self.meta = meta
    }
    
    struct Post {
        let id: Int
        let title: String
        let body: String
        let draft: Bool
        let url: String
        let created_at: String
        let tags: Tag
        let scope: String
        let groups: Group
        let user: User
        let comments: Comment
        
        init?(dict: [String: Any]) {
            
            guard let id = dict["id"] as? Int else { return nil }
            guard let title = dict["title"] as? String else { return nil }
            guard let body = dict["body"] as? String else { return nil }
            guard let draft = dict["draft"] as? Bool else { return nil }
            guard let url = dict["url"] as? String else { return nil }
            guard let created_at = dict["created_at"] as? String else { return nil }
            guard let tagDict = dict["tags"] as? [String: Any] else { return nil }
            guard let tags = Tag(dict: tagDict) else { return nil }
            guard let scope = dict["scope"] as? String else { return nil }
            guard let groupDict = dict["groups"] as? [String: Any] else { return nil }
            guard let groups = Group(dict: groupDict) else { return nil }
            guard let userDict = dict["user"] as? [String: Any] else { return nil }
            guard let user = User(dict: userDict) else { return nil }
            guard let commentDict = dict["comments"] as? [String: Any] else { return nil }
            guard let comments = Comment(dict: commentDict) else { return nil }
            
            self.id = id
            self.title = title
            self.body = body
            self.draft = draft
            self.url = url
            self.created_at = created_at
            self.tags = tags
            self.scope = scope
            self.groups = groups
            self.user = user
            self.comments = comments
        }
        
        struct Tag {
            let name: String
            
            init?(dict: [String: Any]) {
                guard let name = dict["name"] as? String else { return nil }
                
                self.name = name
            }
        }
        
        struct Group {
            let id: Int
            let name: String
            
            init?(dict: [String: Any]) {
                guard let id = dict["id"] as? Int else { return nil }
                guard let name = dict["name"] as? String else { return nil }
                
                self.id = id
                self.name = name
            }
        }
        
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
        
        struct Comment {
            let id: Int
            let body: String
            let created_at: String
            let user: User?
            
            init?(dict: [String: Any]) {
                guard let id = dict["id"] as? Int else { return nil }
                guard let body = dict["body"] as? String else { return nil }
                guard let created_at = dict["created_at"] as? String else { return nil }
                guard let userDict = dict["user"] as? [String: Any] else { return nil }
                guard let user = User(dict: userDict) else { return nil }
                
                self.id = id
                self.body = body
                self.created_at = created_at
                self.user = user
            }
        }
    }
    
    struct Meta {
        let previous_page: String
        let next_page: String
        let total: Int
        
        init?(dict: [String: Any]) {
            guard let previous_page = dict["previous_page"] as? String else { return nil }
            guard let next_page = dict["next_page"] as? String else { return nil }
            guard let total = dict["total"] as? Int else { return nil }
            
            self.previous_page = previous_page
            self.next_page = next_page
            self.total = total
        }
    }
}
