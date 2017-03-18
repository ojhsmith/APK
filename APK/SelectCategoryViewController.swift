//
//  SelectCategoryViewController.swift
//  APK
//
//  Created by Oskar Smith on 10/05/16.
//  Copyright © 2016 Oskar Smith. All rights reserved.
//

import UIKit

protocol SelectCategoryViewControllerDelegate : class {
    
    func selectCategoryViewControllerDidSelectCategory(_ selectCategoryViewController: SelectCategoryViewController, category: CategoryName)
    
}


class SelectCategoryViewController: UIViewController {
    
    weak var delegate: SelectCategoryViewControllerDelegate?

    @IBAction func categoryButtonDidPress(_ sender: UIButton) {

        if let buttonTitle = sender.titleLabel?.text, let category = CategoryName(rawValue:buttonTitle){
            delegate?.selectCategoryViewControllerDidSelectCategory(self, category: category)
        }
        
        dismiss(animated: true, completion: nil)
    }
}
