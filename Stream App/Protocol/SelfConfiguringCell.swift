//
//  SelfConfiguringCell.swift
//  Stream App
//
//  Created by Nomadic on 11/27/20.
//  Copyright © 2020 Nomadic. All rights reserved.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure<U: Hashable>(with value: U)
}
