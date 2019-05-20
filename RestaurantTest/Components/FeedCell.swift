//
//  FeedCell.swift
//  RestaurantTest
//
//  Created by Natife on 5/20/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell
{
    @IBOutlet weak var restaurantImage: ImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    
    private var item: Feed!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.layer.borderColor = UIColor(hexString: Colors.cellBorder)?.cgColor
            
        self.layer.borderWidth = 1.0
    }

    private func config()
    {
        self.restaurantName.text = item.restaurant
        self.restaurantImage.loadImage(urlString: item.image_url)
        
        self.foodName.text = item.food_name
        self.foodPrice.text = "$\(item.price)"
    }
    
    func config(with item: Feed)
    {
        self.item = item
        config()
    }
    
    func getItem() -> Feed
    {
        return item
    }
}
