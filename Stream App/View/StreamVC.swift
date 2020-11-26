//
//  ViewController.swift
//  Stream App
//
//  Created by Nomadic on 11/26/20.
//  Copyright © 2020 Nomadic. All rights reserved.
//

import UIKit

class StreamVC: UIViewController {

    var collectionView: UICollectionView!
    
    enum SectionKind: Int, CaseIterable {
        case streams
        
        var orthogonalBehaviour: UICollectionLayoutSectionOrthogonalScrollingBehavior {
            switch self {
            case .streams:
                return .none
            }
        }
    }
    
    typealias DataSource = UICollectionViewDiffableDataSource<SectionKind, AnyHashable>
    private var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureCollectionView()
        configureDataSource()
    }
}

//MARK: - Set up constraints
extension StreamVC {
    func configure() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Watch Live Streams"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1)]
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.register(StreamCell.self, forCellWithReuseIdentifier: StreamCell.reuseId)
        collectionView.backgroundColor = .systemBackground
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
}

//MARK: - CollectionView Layout
extension StreamVC {
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let sectionType = SectionKind(rawValue: sectionIndex) else { fatalError("Could not get a section") }
            
            switch sectionType {
            case .streams:
                return self.createStreamLayout()
            }
        }
        return layout
    }
    
    private func createStreamLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        return section
    }
}


//MARK: - Data Source
extension StreamVC {
    func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let section = SectionKind(rawValue: indexPath.section) else { fatalError("Uknown section kind") }
            switch section {
            case .streams:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StreamCell.reuseId, for: indexPath) as? StreamCell else { fatalError("Could not dequeue a Section Cell")}
                
                cell.configure(with: item)
                return cell
            }
        })
    }
}


//MARK - Collectionview Delegate
extension StreamVC: UICollectionViewDelegate {
    
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

