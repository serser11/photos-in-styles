//
//  PlaceViewController.swift
//  iosFinalProject
//
//  Created by Jiehan Wang on 11/28/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class PlaceViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    // An array to hold the list of possible locations.
    var likelyPlaces: [GMSPlace] = []
    var selectedPlace: GMSPlace?
    
    // Cell reuse id (cells that scroll out of view can be reused).
    let cellReuseIdentifier = "cell";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller provides delegate methods and row data for the table view.
        tableView.delegate = self as? UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        
        tableView.reloadData()
    }
    
    // Pass the selected place to the new view controller.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToMain" {
            if let nextViewController = segue.destination as? MapViewController {
                //nextViewController.selectedPlace = selectedPlace
            }
        }
    }
}

// Respond when a user selects a place.
extension PlaceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlace = likelyPlaces[indexPath.row]
        performSegue(withIdentifier: "unwindToMain", sender: self)
    }
}

// Populate the table with the list of most likely places.
extension PlaceViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return likelyPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
    let collectionItem = likelyPlaces[indexPath.row]
    
    cell.textLabel?.text = collectionItem.name
    
    return cell
    }
    
    // Adjust cell height to only show the first five items in the table
    // (scrolling is disabled in IB).
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return self.tableView.frame.size.height/5
    }
    
    // Make table rows display at proper height if there are less than 5 items.
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    if (section == tableView.numberOfSections - 1) {
    return 1
    }
    return 0
    }
}