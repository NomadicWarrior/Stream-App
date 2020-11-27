//
//  ViewController.swift
//  Stream App
//
//  Created by Nomadic on 11/26/20.
//  Copyright © 2020 Nomadic. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

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
    
    let streamData: [Stream] = [Stream(title: "Creature of Habit (2009), sci-fi horror trailer + teaser", urlLink: "https://archive.org/download/CreatureOfHabit2009Sci-fiHorrorTrailerTeaser/trailer4small2_512kb.mp4", image: "1"),
    
    Stream(title: "Forbidden Planet trailer", urlLink: "https://archive.org/download/ForbiddenPlanetTrailer/FB_trailer.mp4", image: "2"),
    Stream(title: "Alien - trailer", urlLink: "https://archive.org/download/Alien-Trailer/Trailer-Alien.mp4", image: "3"),
    Stream(title: "Stream 4", urlLink: "4", image: "4")]
    
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
         item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: -10, trailing: 20)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(220))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        //group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: -10, trailing: -20)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
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
        
        var snapshot = NSDiffableDataSourceSnapshot<SectionKind, AnyHashable>()
        snapshot.appendSections([.streams])
        
        //let streams: [Stream] = Stream.streamData()
        
        snapshot.appendItems(streamData, toSection: .streams)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}


//MARK - Collectionview Delegate
extension StreamVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Start play stream video
        guard let url = URL(string: streamData[indexPath.row].urlLink) else { return }
        
        let player = AVPlayer(url: url)
        let vc = AVPlayerViewController()
        vc.player = player
        present(vc, animated: true, completion: nil)
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

