//
//  Minecraft.swift
//  MinecraftServerList
//
//  Created by 荻原湧志 on 2018/04/22.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import Foundation
import Siesta

struct Minecraft: Codable{
    let name: String?
    enum CodingKeys: String,CodingKey{
        case name
    }
    
    public var description: String { return "Minecraft: \(name)" }
}
