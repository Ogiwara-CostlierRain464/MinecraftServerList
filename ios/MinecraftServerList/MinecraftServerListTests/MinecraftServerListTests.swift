//
//  MinecraftServerListTests.swift
//  MinecraftServerListTests
//
//  Created by 荻原湧志 on 2018/04/22.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import XCTest
import Gryphon
import Siesta

@testable import MinecraftServerList

class MinecraftServerListTests: XCTestCase {
    
    func testExample() {
        let json = """
        [
            {
                "name" : "test"
            }
        ]
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let data = try! decoder.decode(Array<Minecraft>.self, from: json)

        print(data)

        assert(true)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

final class API{}

extension API{
    final class Messages: Requestable{
        static var baseURL: String = "http://rinov.jp/"
        
        static var path: String = "Gryphon-Tutorial.php"
        
        class func getMessage() -> Task<String, Error> {
            let task = Task<String, Error> { result in
                let url = URL(string: baseURL + path)!
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                let session = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                    guard let data = data,
                        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [AnyObject],
                        let message = json?[0]["result"] as? String else {
                            result(.error(ResponseError.unexceptedResponse(error as AnyObject)))
                            return
                    }
                    result(.response(message))
                })
                session.resume()
            }
            return task
        }
    }
}

class Github{
    
    private let service = Service(baseURL: "https://api.github.com", standardTransformers: [.text, .image])
    
    init() {
        LogCategory.enabled = [.network]
        
        let jsonDecoder = JSONDecoder()
        
        service.configureTransformer("/users/*"){
            try jsonDecoder.decode(User.self, from: $0.content)
        }
    }
    
    func user(_ username: String) -> Resource{
        return service
            .resource("/users")
            .child(username)
    }
}

struct User: Codable{
    let login, repositoriesURL, avatarURL: String
    let name: String?
    
    enum CodingKeys: String, CodingKey{
        case login
        case name
        case repositoriesURL = "repos_url"
        case avatarURL = "avatar_url"
    }
}

