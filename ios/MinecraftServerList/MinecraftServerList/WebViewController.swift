//
//  WebViewController.swift
//  MinecraftServerList
//
//  Created by 荻原湧志 on 2018/04/28.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import Alamofire

class WebViewController : UIViewController, WKNavigationDelegate{
    
    @IBOutlet weak var web: WKWebView!
    
    static let keio = "https://portal.keio.jp/koid/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        open(url: WebViewController.keio)
        web.navigationDelegate = self
    }
    
    func open(url: String){
        let req = URLRequest(url: URL(string: url)!)
        
        web.load(req)
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        let url = web.url
        
        url.map {
            print("Current: \($0.absoluteString)")
            
            if $0.absoluteString == WebViewController.keio {
                WKWebsiteDataStore.default().httpCookieStore.getAllCookies {
                    // let req = MyReqest($0)
                    let a = $0
                    let req = MyReqest([HTTPCookie]())
                    
                    Alamofire.request(req).response(completionHandler: {
                        $0.response.map {
                            print($0.url)
                        }
                    })
                }
            }
        }
    }
    
    class MyReqest : URLRequestConvertible{
        
        var cookies: [HTTPCookie]!
        
        init(_ cookies: [HTTPCookie]) {
            self.cookies = cookies
        }
        
        func asURLRequest() throws -> URLRequest {
            var req = URLRequest(url: URL(string: WebViewController.keio)!)
            
            req.allHTTPHeaderFields = HTTPCookie.requestHeaderFields(with: cookies)
            return req
        }
    }
}
