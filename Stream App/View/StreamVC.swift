//
//  ViewController.swift
//  Stream App
//
//  Created by Nomadic on 11/26/20.
//  Copyright © 2020 Nomadic. All rights reserved.
//

import UIKit

class StreamVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Watch Live Streams"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)]
    }


}
