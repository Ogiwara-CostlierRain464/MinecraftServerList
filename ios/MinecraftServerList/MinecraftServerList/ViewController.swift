//
//  ViewController.swift
//  MinecraftServerList
//
//  Created by 荻原湧志 on 2018/04/22.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import UIKit
import Siesta
import Alamofire

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, ResourceObserver{

    @IBOutlet weak var table: UITableView!
    
    private var dataset = [Minecraft]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let minecraftRes = MinecraftService().minecrafts()
        minecraftRes
            .addObserver(self)
            .load()
    }

    func resourceChanged(_ resource: Resource, event: ResourceEvent) {
        show(resource.typedContent())
    }
    
    func show(_ arr: NSArray?){
        arr.map { list in
            list.forEach { pdic in
                let dic = pdic as! NSDictionary
                let name = dic["name"] as! String
                let intro = dic["introduction"] as! String
                let desc = dic["description"] as! String
                
                dataset.append(Minecraft(name: name, introduction: intro, description: desc))
            }
            table.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMinecraft" {
            let secondViewController = segue.destination as! MinecraftViewController
            let s = sender as! CustomTableViewCell
            
            secondViewController.model = s.model
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataset.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "TableViewCell") as! CustomTableViewCell
        cell.name.text = dataset[indexPath.row].name
        cell.introduction.text = dataset[indexPath.row].introduction
        cell.model = dataset[indexPath.row]
        
        return cell
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
            .child(username.lowercased())
    }
}

struct User : Codable{
    let name: String?
}

class MinecraftService{
    private let service = Service(baseURL: "http://ogiwara.ddo.jp:8080/api")
    
    //TODO: Json Parse
    func minecrafts() -> Resource{
        return service
            .resource("/minecrafts")
    }
}

