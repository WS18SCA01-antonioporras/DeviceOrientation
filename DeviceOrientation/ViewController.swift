//
//  ViewController.swift
//  DeviceOrientation
//
//  Created by Antonio Porras on 1/2/19.
//  Copyright © 2019 Antonio Porras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let names: [String] = [   //Pull down Hardware -> Orientation
        " ",       //0
        "pic01",  //1 home button at bottom
        "pic02",  //2 home button at top
        "pic03",  //3 home button on right
        "pic04",  //4 home button on left
        "pic05",  //5 screen facing upwards
        "pic06",  //6 screen facfing downwards
    ];

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1);
        
        imageView.contentMode = .scaleToFill
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(orientationChanged),
            name: UIDevice.orientationDidChangeNotification,
            object: nil);
        self.view.addSubview(imageView)
        
    }
    

    @IBOutlet weak var Label: UILabel!
    
    @objc func orientationChanged (_ notification: NSNotification) {
        imageView.image = UIImage(named: names[UIDevice.current.orientation.rawValue])
        Label.text = names[UIDevice.current.orientation.rawValue];
        print(UIDevice.current.orientation.rawValue);
        updateTextLabel();
    }
    
    func updateTextLabel() {
        Label.textAlignment = .center
        switch UIDevice.current.orientation {
            
        case .portrait:
            Label.text = "Shoulders"
        case .portraitUpsideDown:
            Label.text = "Abs"
        case .landscapeLeft:
            Label.text = "Chest"
        case .landscapeRight:
            Label.text = "Abs"
        case .faceDown:
            Label.text = "Chest"
        case .faceUp:
            Label.text = "Back"
        case .unknown:
            Label.text = "Unknown"
        }
        
    }

    
}

