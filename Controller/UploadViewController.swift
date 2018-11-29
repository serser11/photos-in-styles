//
//  UploadViewController.swift
//  iosFinalProject
//
//  Created by Jiehan Wang on 11/26/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func upload(_ sender: Any) {
        performSegue(withIdentifier: "toPicker", sender: self)
    }
    
    @IBAction func viewPosts(_ sender: Any) {
        performSegue(withIdentifier: "toAllPosts", sender: self)
    }
    @IBAction func unwindToVC1(segue:UIStoryboardSegue) { }
    
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

