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

//MARK - Content view
import SwiftUI

struct StreamProvider: PreviewProvider {
    static var previews: some View {
        ContentView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContentView: UIViewControllerRepresentable {
        
        let vc = StreamVC()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<StreamProvider.ContentView>) -> StreamVC {
            return vc
        }
        
        func updateUIViewController(_ uiViewController: StreamProvider.ContentView.UIViewControllerType, context: UIViewControllerRepresentableContext<StreamProvider.ContentView>) {
        }
    }
}

