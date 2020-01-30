//
//  ViewController.swift
//  MultilineStackViews
//
//  Created by Anas Merbouh on 2020-01-29.
//  Copyright © 2020 Anas Merbouh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private static let gridViewRowWidth: CGFloat = 5
    private static let gridViewRowHeight: CGFloat = 40
    
    // MARK: - Properties
    
    private let gridView: CRGridView
    
    // MARK: - Initialization
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.gridView = CRGridView(rowWidth: ViewController.gridViewRowWidth, rowHeight: ViewController.gridViewRowHeight)
        
        // Call the super class's implementation of the constructor.
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        self.gridView = CRGridView(rowWidth: ViewController.gridViewRowWidth, rowHeight: ViewController.gridViewRowHeight)
        
        // Call the super class's implementation of the constructor.
        super.init(coder: coder)
    }
    
    // MARK: - View's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.addSubview(gridView)
        
        gridView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        gridView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 29).isActive = true
        gridView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -29).isActive = true
        
        for i in 0...79 {
            let dummyView = CRTrajectStepView()
            
            // Configure the view...
            dummyView.setLineNumber(i)
            
            gridView.addChild(dummyView)
        }
    }
    
}

