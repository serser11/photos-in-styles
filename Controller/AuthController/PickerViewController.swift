//
//  PhotoPickerViewController.swift
//  iosFinalProject
//
//  Created by MacBook on 11/25/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    func openOptions() {
        let alert = UIAlertController(title: "choose image", message: "Pick Image From: ", preferredStyle: .alert)
        let galleryAction = UIAlertAction(title: "Gallery", style: .default, handler: {
            btn in
            self.imagePicker.sourceType = .photoLibrary
            self.openPicker()
        })
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
            btn in
            self.imagePicker.sourceType = .camera
            self.openPicker()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(galleryAction)
        alert.addAction(cameraAction)
        alert.addAction(cancelAction)
        imagePicker.allowsEditing = true
        self.present(alert, animated: true, completion: nil)
    }
    func selectedImage(choosenImage: UIImage) {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        let choosenImage = info[UIImagePickerController.InfoKey.originalImage]! as! UIImage
        selectedImage(choosenImage: choosenImage)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func openPicker() {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    //    @IBAction func chooseImage(_ sender: Any) {
    //        imagePicker.sourceType = .photoLibrary
    //        imagePicker.allowsEditing = true
    //        present(imagePicker,animated: true, completion: nil)
    //    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
//extension PhotoPickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
//            imageDisplay.image = image
//        }
//        dismiss(animated: true, completion: nil)
//    }
//
//


