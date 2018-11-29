//
//  TransferStyle.swift
//  iosFinalProject
//
//  Created by Collin Cao on 11/28/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import VideoToolbox


class TransferStyle {
    
    typealias FilteringCompletion = ((UIImage?) -> ())
    
    //COREML
    func process(input: UIImage, completion: @escaping FilteringCompletion) {
        
        // Initialize the NST model
        let model = StarryNight()
        
        // Next steps are pretty heavy, better process them on a background thread
        DispatchQueue.global().async {
            
            // 1 - Transform our UIImage to a PixelBuffer of appropriate size
            guard let cvBufferInput = input.pixelBuffer(width: 720, height: 720) else {
                print("UIImage to PixelBuffer failed")
                completion(nil)
                return
            }
            
            // 2 - Feed that PixelBuffer to the model
            guard let output = try? model.prediction(inputImage: cvBufferInput) else {
                print("Model prediction failed")
                completion(nil)
                return
            }
            
            // 3 - Transform PixelBuffer output to UIImage
            guard let outputImage = UIImage(pixelBuffer: output.outputImage) else {
                print("PixelBuffer to UIImage failed")
                completion(nil)
                return
            }
            
            // 4 - Resize result to the original size, then hand it back to the main thread
            let finalImage = outputImage.resize(to: input.size)
            DispatchQueue.main.async {
                completion(finalImage)
            }
        }
    }
    
}

