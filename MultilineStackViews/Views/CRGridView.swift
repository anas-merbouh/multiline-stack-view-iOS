//
//  CRGridView.swift
//  MultilineStackViews
//
//  Created by Anas Merbouh on 2020-01-29.
//  Copyright © 2020 Anas Merbouh. All rights reserved.
//

import UIKit

class CRGridView: UIStackView {

    // MARK: - Properties
    
    private var children: [UIView]
    private var currentRow: UIStackView?
    
    /// A CGFloat representing the height of each child of the grid view.
    private let rowWidth: CGFloat
    
    /// A CGFloat representing the height of each child of the grid view.
    private let rowHeight: CGFloat
    
    // MARK: - Initialization
    
    init(rowWidth: CGFloat, rowHeight: CGFloat, frame: CGRect) {
        self.children = []
        self.rowWidth = rowWidth
        self.rowHeight = rowHeight
        
        // Call the super class's implementation of the constructor.
        super.init(frame: frame)
        
        // Configure the stack view.
        configure()
    }
    
    convenience init(rowWidth: CGFloat, rowHeight: CGFloat) {
        self.init(rowWidth: rowWidth, rowHeight: rowHeight, frame: .zero)
    }
    
    required init(coder: NSCoder) {
        self.children = []
        self.rowWidth = 50.0
        self.rowHeight = 50.0
        
        // Call the super class's implementation of the constructor.
        super.init(coder: coder)
        
        // Configure the stack view.
        configure()
    }
    
    // MARK: - Methods
    
    private func configure() {
        axis = .vertical
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func prepareRowForInsertion() -> UIStackView {
        let row = UIStackView()
        
        // Configure the row...
        row.axis = .horizontal
        row.distribution = .fillEqually
        row.translatesAutoresizingMaskIntoConstraints = false
        
        return row
    }
    
    public func addChild(_ child: UIView) {
        let shouldInsertRow = CGFloat(children.count).truncatingRemainder(dividingBy: rowWidth) == 0
        
        // Initialize the current row property and add it as an arranged
        // subview of the stack view.
        if currentRow == nil || shouldInsertRow {
            currentRow = prepareRowForInsertion()
            addArrangedSubview(currentRow!)
        }

        // Configure the child...
        child.translatesAutoresizingMaskIntoConstraints = false
        child.heightAnchor.constraint(equalToConstant: self.rowHeight).isActive = true
        
        // Add the chil as an arranged subview of the stack view.
        children.append(child)
        currentRow!.addArrangedSubview(child)
    }
    
}
