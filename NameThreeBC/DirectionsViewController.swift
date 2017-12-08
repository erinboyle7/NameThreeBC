//
//  DirectionsViewController.swift
//  NameThreeBC
//
//  Created by Erin Boyle on 11/25/17.
//  Copyright © 2017 Erin Boyle. All rights reserved.
//

import UIKit

class DirectionsViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var directionsLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.alpha = 0
        gameName.alpha = 0
        directionsLabel.alpha = 0
        copyrightLabel.alpha = 0
        startButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            self.backgroundImage.alpha = 0.6
        }) { (true) in
            self.showTitle()
        }
    }
    
    func showTitle() {
        UIView.animate(withDuration: 1, animations: {
            self.gameName.alpha = 1
        }, completion: { (true) in
            self.showCopyrightAndButton()
        })
    }
    
    func showCopyrightAndButton() {
        UIView.animate(withDuration: 0.5, animations: {
            self.copyrightLabel.alpha = 1
            self.startButton.alpha = 1
        }) { (true) in
            self.showDirections()
        }
    }
    
    func showDirections() {
        UIView.animate(withDuration: 3, animations: {
            self.directionsLabel.alpha = 1
        })
    }

    @IBAction func startButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "beginGame", sender: nil)
    }
    
}
