//
//  CRTrajectStepsTableViewCell.swift
//  MultilineStackViews
//
//  Created by Merbouh, Anas on 2020-01-31.
//  Copyright © 2020 Anas Merbouh. All rights reserved.
//

import UIKit

fileprivate let collectionViewCellReuseIdentifier = "\(UICollectionViewCell.self)"

class CRTrajectStepsTableViewCell: UITableViewCell {
    
    public static let reuseIdentifier: String = "\(CRTrajectStepsTableViewCell.self)"
    public static let estimatedRowHeight: CGFloat = 80
    
    // MARK: - Properties
    
    private var trajectSteps: [TrajectStep]
    private let collectionView: UICollectionView
    
    public var collectionViewContentHeight: CGFloat {
        return collectionView.collectionViewLayout.collectionViewContentSize.height
    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.trajectSteps = []
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        // Call the super class's implementation of the constructor.
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        // Register cell classes...
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellReuseIdentifier)
        
        // Configure the collection view.
        configureCollectionView()
    
        // Configure the appropriate constraints.
        configureConstraints()
        reloadCollectionViewData()
        
    }
    
    required init?(coder: NSCoder) {
        self.trajectSteps = []
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        // Call the super class's implementation of the constructor.
        super.init(coder: coder)
    
        // Register cell classes...
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellReuseIdentifier)
        
        // Configure the collection view.
        configureCollectionView()
        
        // Configure the appropriate constraints.
        configureConstraints()
    }
    
    // MARK: - Methods
    
    private func configureConstraints() {
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the collection view as a subview.
        contentView.addSubview(collectionView)
    }
    
    public func reloadCollectionViewData() {
        collectionView.reloadData()
    }
    
    public func setCollectionViewHeight(_ height: CGFloat) {
        collectionView.heightAnchor.constraint(equalToConstant: height).isActive = true
    }

}

// MARK: - Collection view data source
extension CRTrajectStepsTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int.random(in: 0 ... 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellReuseIdentifier, for: indexPath)
        
        
        // Configure the cell...
        cell.backgroundColor = indexPath.row % 2 == 0  ? .red : .blue
        
        return cell
    }
    
}
