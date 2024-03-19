//
//  UIViewController+CoreData.swift
//  REFFON
//
//  Created by user250954 on 3/17/24.
//

import UIKit
import CoreData

extension UIViewController{
    
    var context: NSManagedObjectContext{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
}
