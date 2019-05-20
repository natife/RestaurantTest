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
        NetworkService().getFeed()
        { [weak self] feeds in
            guard let self = self else {return}
            self.items = feeds
            
            DispatchQueue.main.async
                {
                self.configTableView()
            }
        }
    }

    private func configTableView()
    {
        self.feedTableView.delegate = self
        self.feedTableView.dataSource = self
        self.feedTableView.registerWithNib(cellClass: FeedCell.self)
        self.feedTableView.rowHeight = UITableView.automaticDimension
        self.feedTableView.estimatedRowHeight = 170
        self.feedTableView.reloadData()
    }
    
    private func details(with item: Feed)
    {
        let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController")
        
        if let view = viewController as? DetailsViewController
        {
            view.config(with: item)
            
            let navigationController = UINavigationController(rootViewController: view)
            
            DispatchQueue.main.async
                {
                self.present(navigationController, animated: true, completion: nil)
            }
        }
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
        cell.config(with: self.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath) as! FeedCell
        details(with: cell.getItem())
    }
    
}

