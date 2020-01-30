//
//  CRTrajectStepView.swift
//  MultilineStackViews
//
//  Created by Anas Merbouh on 2020-01-29.
//  Copyright © 2020 Anas Merbouh. All rights reserved.
//

import UIKit

class CRTrajectStepView: UIView {

    @IBOutlet private weak var contentContainerView: UIView!
    
    @IBOutlet private weak var transportTypeImageView: UIImageView!
    @IBOutlet private weak var lineNumberLabel: UILabel!
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Load the view.
        loadXIB()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        // Load the view.
        loadXIB()
    }
    
    // MARK: - Methods
    
    private func loadXIB() {
        let name = "\(CRTrajectStepView.self)"
        let bundle = Bundle(for: CRTrajectStepView.self)
        
        // Load the view from the appropriate NIB file.
        _ = UINib(nibName: name, bundle: bundle).instantiate(withOwner: self)
        
        // Add the content view to the view's hierarchy.
        addSubview(contentContainerView)
    }
    
    // MARK: - Methods
    
    override func layoutSubviews() {
        contentContainerView.frame = bounds
    }
    
    public func setLineNumber(_ lineNumber: Int) {
        lineNumberLabel.text = "\(lineNumber)"
    }

}
