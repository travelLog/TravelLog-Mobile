//
//  ImageEditing.swift
//  Selfie
//
//  Created by Paul Vagner on 10/30/15.
//  Copyright © 2015 Jo Albright. All rights reserved.
//

import UIKit

func resizeImage(image: UIImage, newSize: CGSize) -> UIImage {
    
    // only works if newSize is a square

    let squareWidth = newSize.width
    
    let isPortrait = image.size.width < image.size.height
    
    let scale = isPortrait ? squareWidth / image.size.width : squareWidth / image.size.height
    
    let scaleHeight = isPortrait ? image.size.height * scale : squareWidth
    
    let scaleWidth = isPortrait ? squareWidth : image.size.width * scale

    UIGraphicsBeginImageContext(newSize)
    
    image.drawInRect(CGRectMake((squareWidth - scaleWidth) / 2, (squareWidth - scaleHeight) / 2, scaleWidth, scaleHeight))
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage

}

func flipImage(image: UIImage) -> UIImage {
    
    UIGraphicsBeginImageContext(image.size)
    
    let ctx = UIGraphicsGetCurrentContext()
    CGContextScaleCTM(ctx, -1.0, 1.0); // flip horizontal

    
    image.drawInRect(CGRectMake(-image.size.width, 0, image.size.width, image.size.height))
    
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    return newImage
    
}



