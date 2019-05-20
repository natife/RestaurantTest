//
//  DetailsViewController.swift
//  RestaurantTest
//
//  Created by Natife on 5/20/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController
{
   lazy var doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(done))
    
    private var item: Feed!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func config(with item: Feed)
    {
        self.item = item
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(hexString: Colors.navigationColor)
        self.title = "Detail screen"
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 18.0)!,
            NSAttributedString.Key.foregroundColor: UIColor(hexString: Colors.textColor) as Any
        ]
        
        doneButton.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 16.0)!,
            NSAttributedString.Key.foregroundColor: UIColor(hexString: Colors.textColor) as Any],
                                           for: .normal)
        
        self.navigationItem.rightBarButtonItem = doneButton
        
        nameLabel.text = item.restaurant
    }
    
    @objc private func done()
    {
        self.dismiss(animated: true, completion: nil)
    }
}
