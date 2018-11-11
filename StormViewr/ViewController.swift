//
//  ViewController.swift
//  StormViewr
//
//  Created by Mohamed Alaa El-Din on 11/11/18.
//  Copyright © 2018 Mohamed Alaa El-Din. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var images = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm      = FileManager.default
        
        let path    = Bundle.main.resourcePath!
        
        let items   = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                images.append(item)
            }
        }
        
        print(images)
    }


}

