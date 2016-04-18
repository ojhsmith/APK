//
//  Helpers.swift
//  APK
//
//  Created by Oskar Smith on 17/04/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit

extension UIImage {
    class func imageWithColor(color:UIColor?) -> UIImage! {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0);
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        let context = UIGraphicsGetCurrentContext();
        if let color = color {
            color.setFill()
        }
        else {
            UIColor.whiteColor().setFill()
        }
        CGContextFillRect(context, rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
}