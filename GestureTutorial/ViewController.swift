//
//  ViewController.swift
//  GestureTutorial
//
//  Created by Ankit Gupta on 02/04/19.
//  Copyright © 2019 Ankit Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.isUserInteractionEnabled = true
        
//        tapGestureExample()
        
//        panGestureExample()
        
//        pinchGestureExample()
        
//        rotationGestureExample()
        
//        swipeGestureExample()
        
        longPressGestureExample()
    }

}

// MARK: Tap Gesture Example
extension ViewController {
    
    func tapGestureExample() {
        lbl.text = "Tap Gesture Example"
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(self.onImageTap))
        img.addGestureRecognizer(imageGesture)
    }
    
    @objc func onImageTap() {
        lbl.text = "Image Tapped"
    }
    
}

// MARK: Pan Gesture Example
extension ViewController {
    
    func panGestureExample() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.imageClicked))
        img.addGestureRecognizer(panGesture)
    }
    
    @objc func imageClicked(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let imageView = recognizer.view {
            imageView.center = CGPoint(x: imageView.center.x + translation.x, y: imageView.center.y + translation.y)
        }
        recognizer.setTranslation(.zero, in: self.view)
    }
    
}

// MARK: Pinch Gesture Example
extension ViewController {
    
    func pinchGestureExample() {
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.onImagePinch))
        img.addGestureRecognizer(pinchGesture)
    }
    
    @objc func onImagePinch(_ recognizer: UIPinchGestureRecognizer) {
        if let imageView = recognizer.view {
            imageView.transform = imageView.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
    }
    
}

// MARK: Rotation Gesture Recognizer
extension ViewController {
    
    func rotationGestureExample() {
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.onImageRotate))
        img.addGestureRecognizer(rotateGesture)
    }
    
    @objc func onImageRotate(_ recognizer: UIRotationGestureRecognizer) {
        if let imageView = recognizer.view {
            imageView.transform = imageView.transform.rotated(by: recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
}

// MARK: Swipe Gesture Example
extension ViewController {
    
    func swipeGestureExample() {
        let directions: [UISwipeGestureRecognizer.Direction] = [.up, .down, .left, .right]
        for direction in directions {
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.onImageSwipe))
            swipeGesture.direction = direction
            img.addGestureRecognizer(swipeGesture)
        }
    }
    
    @objc func onImageSwipe(_ recognizer: UISwipeGestureRecognizer) {
        switch recognizer.direction {
        case .up:
            lbl.text = "Up Swipe Action"
        case .down:
            lbl.text = "Down Swipe Action"
        case .left:
            lbl.text = "Left Swipe Action"
        case .right:
            lbl.text = "Right Swipe Action"
        default:
            break
        }
    }
    
}

// MARK: Long Press Gesture Example
extension ViewController {
    
    func longPressGestureExample() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.onImageViewLongPress))
        longPressGesture.minimumPressDuration = 1
        img.addGestureRecognizer(longPressGesture)
    }
    
    @objc func onImageViewLongPress(_ recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            lbl.text = "Long Press Started"
        } else if recognizer.state == .ended {
            lbl.text = "Long Press Ended"
        }
    }
    
}
