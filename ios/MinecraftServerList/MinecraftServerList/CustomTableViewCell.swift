//
//  CustomTableViewCell.swift
//  MinecraftServerList
//
//  Created by 荻原湧志 on 2018/04/22.
//  Copyright © 2018年 ogiwara. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var introduction: UILabel!
    var model: Minecraft!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
