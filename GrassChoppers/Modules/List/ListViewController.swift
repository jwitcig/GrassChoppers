//
//  ViewController.swift
//  GrassChoppers
//
//  Created by Developer on 7/30/20.
//  Copyright © 2020 JwitApps. All rights reserved.
//

import SnapKit
import UIKit

class ListViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(TitleCollectionViewCell.self)
        collectionView.collectionViewLayout = UICollectionView.fullScreenWidthLayout()
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.allowsSelection = true
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let logicController: ListLogicControlling
    private let adapter: CollectionViewAdapting
    
    init(
        logicController: ListLogicControlling,
        adapter: CollectionViewAdapting
    ) {
        self.logicController = logicController
        self.adapter = adapter
        
        super.init(nibName: nil, bundle: nil)
        
        self.logicController.delegate = self
        self.collectionView.dataSource = adapter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupAppearance()
    }
    
    private func setupAppearance() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ListViewController: ListLogicControllingDelegate {
    func updateData() {
        collectionView.reloadData()
    }
}

protocol CollectionViewAdapting: UICollectionViewDataSource, UICollectionViewDelegate { }
