//
//  ImageView.swift
//  RestaurantTest
//
//  Created by Natife on 5/20/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import UIKit

open class ImageView: UIImageView
{
    public static let imageCache = NSCache<NSString, ImageCacheItem>()
    
    open var shouldUseEmptyImage = true
    
    private var urlStringForChecking: String?
    private var emptyImage: UIImage?
    
    
    public init(cornerRadius: CGFloat = 0, emptyImage: UIImage? = nil)
    {
        super.init(frame: .zero)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        self.emptyImage = emptyImage
    }
    
    required public init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    open func loadImage(urlString: String?, completion: (() -> ())? = nil)
    {
        image = nil
        guard let urlString = urlString else {completion?(); return }
        self.urlStringForChecking = urlString
        
        let urlKey = urlString as NSString
        
        if let cachedItem = ImageView.imageCache.object(forKey: urlKey)
        {
            image = cachedItem.image
            completion?()
            return
        }
        
        guard let url = URL(string: urlString) else
        {
            if shouldUseEmptyImage
            {
                image = emptyImage
            }
            
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler:
            { [weak self] data, response, error in
            guard let imageData = data, error == nil else { return }
            
            DispatchQueue.main.async
                {
                if let image = UIImage(data: imageData)
                {
                    let cacheItem = ImageCacheItem(image: image)
                    ImageView.imageCache.setObject(cacheItem, forKey: urlKey)
                    
                    if urlString == self?.urlStringForChecking
                    {
                        self?.image = image
                        completion?()
                    }
                }
                else
                {
                    let info_string = String(data: imageData, encoding: .utf8) ?? "Unrecognized data"
                    print(info_string)
                }
            }
            
        }).resume()
    }
}
