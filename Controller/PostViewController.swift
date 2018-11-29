//
//  PostViewController.swift
//  iosFinalProject
//
//  Created by Jiehan Wang on 11/26/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import FirebaseAuth

class PostViewController: UIViewController {
    var post: Post!
    var position: String!
    var name: String!
    @IBOutlet weak var imageToPost: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageToPost.image = UIImage(named: "test")
        position = "Berkeley"
        name = "test"
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func toPost(_ sender: Any) {
        addPost(postImage: imageToPost.image!, username: (Auth.auth().currentUser?.displayName)!, postName: name, currentPosition: position)
        let alertController = UIAlertController(title: "Post successful.", message: "Good!", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func unWind(_ sender: Any) {
        performSegue(withIdentifier: "unwindBack", sender: self)
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
