//
//  Extension.swift
//  RestaurantTest
//
//  Created by Natife on 5/20/19.
//  Copyright © 2019 Natife. All rights reserved.
//

import UIKit

extension UITableViewCell
{
    public static var reuseIdentifier: String
    {
        return String(describing: self)
    }
}

extension UITableView
{
    public func register<T: UITableViewCell>(cellClass: T.Type)
    {
        register(cellClass, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    public func registerWithNib<T: UITableViewCell>(cellClass: T.Type)
    {
        register(UINib(nibName: String(describing: cellClass), bundle: nil), forCellReuseIdentifier: String(describing: cellClass.self))
    }
    
    public func removeCell(with indexPath: IndexPath)
    {
        self.deleteRows(at: [indexPath], with: .fade)
    }
}

extension UIColor
{
    public convenience init?(hexString: String)
    {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#")
        {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])
            
            if hexColor.count == 8
            {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber)
                {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
