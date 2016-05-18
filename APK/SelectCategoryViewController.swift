//
//  SelectCategoryViewController.swift
//  APK
//
//  Created by Oskar Smith on 10/05/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit

protocol SelectCategoryViewControllerDelegate : class {
    
    func selectCategoryViewControllerDidSelectCategory(selectCategoryViewController: SelectCategoryViewController, category: CategoryName)
    
}


class SelectCategoryViewController: UIViewController {
    
    
    
    weak var delegate: SelectCategoryViewControllerDelegate?

    @IBAction func categoryButtonDidPress(sender: UIButton) {
        
        if let category = CategoryName(rawValue: sender.tag) {
        delegate?.selectCategoryViewControllerDidSelectCategory(self, category: category)
        }
    }

}
