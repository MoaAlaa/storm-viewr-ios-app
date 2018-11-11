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
        
        title = "Storm Viewer By Alaa"
        
        let fm      = FileManager.default
        
        let path    = Bundle.main.resourcePath!
        
        let items   = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                images.append(item)
            }
        }
        
        navigationController?.navigationBar.prefersLargeTitles = true

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
//        cell.textLabel?.text = pictures[indexPath.row]
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Images", for: indexPath)
        cell.textLabel?.text = images[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Details" view controller and typecasting it to be DetailViewController
        // .instantiateViewController(withIdentifier: "Details") WIll Retuen UIViewController But We Need DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Details") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = images[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }

    }
}
