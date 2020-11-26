//
//  StreamCell.swift
//  Stream App
//
//  Created by Nomadic on 11/27/20.
//  Copyright © 2020 Nomadic. All rights reserved.
//

import UIKit

class StreamCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseId: String = "streams"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure<U>(with value: U) where U : Hashable {
        
    }
}
