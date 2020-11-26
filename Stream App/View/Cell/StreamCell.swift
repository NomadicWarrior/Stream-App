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
    
    let titleLabel: UILabel = {
       let label = UILabel()
        
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        layer.borderWidth = 2
        layer.cornerRadius = 10
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure<U>(with value: U) where U : Hashable {
        guard let streams: Stream = value as? Stream else { return }
        titleLabel.text = streams.title
    }
}
