//
// Created by 荻原湧志 on 2018/04/25.
// Copyright (c) 2018 ogiwara. All rights reserved.
//

import Foundation
import UIKit

class MinecraftViewController: UIViewController{
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var intro: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    var model: Minecraft!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //bind model...
        name.text = model.name
        intro.text = model.introduction
        desc.text = model.description
        
    }
}
