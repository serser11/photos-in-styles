//
//  SawViewController.swift
//  iosFinalProject
//
//  Created by Jiehan Wang on 11/28/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit

class SawViewController: UIViewController {
    var post: Post!
    
    @IBOutlet weak var imageToShow: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageToShow.image = post.postImage
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
