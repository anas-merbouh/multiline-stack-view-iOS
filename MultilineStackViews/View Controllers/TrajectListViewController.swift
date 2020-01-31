//
//  TrajectListViewController.swift
//  MultilineStackViews
//
//  Created by Merbouh, Anas on 2020-01-31.
//  Copyright © 2020 Anas Merbouh. All rights reserved.
//

import UIKit

fileprivate let reuseIdentifier = CRTrajectStepsTableViewCell.reuseIdentifier

class TrajectListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - View's lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register the appropriate cell classes...
        tableView.register(CRTrajectStepsTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = CRTrajectStepsTableViewCell.estimatedRowHeight
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - Table view data source
extension TrajectListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int.random(in: 0 ... 20)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CRTrajectStepsTableViewCell
        
        // Configure the cell...
        cell.layoutIfNeeded()
        cell.reloadCollectionViewData()
        cell.setCollectionViewHeight(cell.collectionViewContentHeight)
        cell.layoutIfNeeded()
        cell.backgroundColor = indexPath.row % 2 == 0 ? .brown : .yellow
        
        return cell
    }
    
}
