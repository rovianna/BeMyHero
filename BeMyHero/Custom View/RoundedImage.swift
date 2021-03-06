//
//  RoundedImage.swift
//  BeMyHero
//
//  Created by Rodrigo Vianna on 30/09/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class RoundedImage: UIImageView {
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            if self.cornerRadius > 0 {
                self.layer.cornerRadius = self.cornerRadius
            }
            self.layer.masksToBounds = self.cornerRadius > 0
            setNeedsDisplay()
        }
    }
    
    
    @IBInspectable
    var roundedCorners: Bool = false {
        didSet {
            self.cornerRadius = min(self.frame.size.width, self.frame.size.height) / 2
            setNeedsDisplay()
        }
    }
}
