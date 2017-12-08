//
//  CountdownViewController.swift
//  NameThreeBC
//
//  Created by Erin Boyle on 11/16/17.
//  Copyright © 2017 Erin Boyle. All rights reserved.
//

import UIKit
import AVFoundation

class CountdownViewController: UIViewController {

    @IBOutlet weak var arrow: UIImageView!
    
    var startY: CGFloat = 0
    var endY: CGFloat = 0
    var soundPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func startCountdown() {   
        UIView.animate(withDuration: 5, animations: {
            self.arrow.frame.origin.y += 530
            self.playSound(soundName: "ticktock", audioPlayer: &self.soundPlayer)
            }, completion: { (true) in
                self.playSound(soundName: "shortBuzz2", audioPlayer: &self.soundPlayer)
                self.performSegue(withIdentifier: "backToGame", sender: nil)
                })
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch { print("Data from \(soundName) could not be played") }
        } else {
            print("Error reading in sound")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startY = self.arrow.frame.origin.y
        endY = startY + 530
        
        super.viewDidAppear(animated)
        startCountdown()
    }
}
