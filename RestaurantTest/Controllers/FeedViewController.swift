//
//  FeedViewController.swift
//  RestaurantTest
//
//  Created by Natife on 5/20/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController
{
    @IBOutlet weak var feedTableView: UITableView!
    
    private var items: [Feed]!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configController()
    }
    
    private func configController()
    {
        configTableView()
    }

    private func configTableView()
    {
        self.feedTableView.delegate = self
        self.feedTableView.dataSource = self
        self.feedTableView.register(FeedCell.self, forCellReuseIdentifier: "FeedCell")
        self.feedTableView.rowHeight = UITableView.automaticDimension
        self.feedTableView.estimatedRowHeight = 170
        self.feedTableView.reloadData()
    }
}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        guard let items = self.items else { return 0 }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedCell        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
//        let cell = tableView.cellForRow(at: indexPath) as! FeedCell
    }
    
}

