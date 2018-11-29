//
//  TakePhotoViewController.swift
//  iosFinalProject
//
//  Created by MacBook on 11/25/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit

class TakePhotoViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var imagePicker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func takePhoto(_ sender: UIButton) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        present(imagePicker,animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imagePicker.delegate = self
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//
//    func initCameraPicker(){
//
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//            let alert = UIAlertController(title: "choose image", message: "Pick Image From: ", preferredStyle: .alert)
//            let galleryAction = UIAlertAction(title: "Gallery", style: .default, handler: {
//                btn in
//                self.imagePicker.sourceType = .photoLibrary
//                self.present(self.imagePicker, animated: true, completion: nil)
//            })
//            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
//                btn in
//                self.imagePicker.sourceType = .camera
//                self.present(self.imagePicker, animated: true, completion: nil)
//            })
//
//            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
//
//            alert.addAction(galleryAction)
//            alert.addAction(cameraAction)
//            alert.addAction(cancelAction)
//            imagePicker.allowsEditing = true
//            self.present(alert, animated: true, completion: nil)
//
//        } else {
//
//            let alert = UIAlertController(title: "Alert", message: "The camera is unavailable on your device", preferredStyle: .alert)
//             let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
//            alert.addAction(cancelAction)
//            self.present(alert, animated: true, completion: nil)
//        }
//
//
//
//    }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
//        let choosenImage = info[UIImagePickerController.InfoKey.originalImage]! as! UIImage
//        selectedImage(choosenImage: choosenImage)
//        dismiss(animated: true, completion: nil)
//    }
//
//    func selectedImage(choosenImage: UIImage) {
//        imageView = choosenImage
//    }
//
}

