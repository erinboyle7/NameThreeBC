//
//  ViewController.swift
//  NameThreeBC
//
//  Created by Erin Boyle on 11/16/17.
//  Copyright © 2017 Erin Boyle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var instructButton: UIButton!
    
    var threeArray = ["Dorms on Coro", "Dorms on Newton", "Dorms on Lower", "Lecture halls", "Orientation Leaders", "Tour guides", "House numbers on Radnor", "House numbers on Foster", "House numbers on Gerald", "Towns in Massachusetts", "High Schools in Massachusetts", "Easy classes", "Hard classes", "Ways to get written up", "Majors in CSOM", "White Mountain flavors", "Members of your '8 man'", "Majors in A&S", "On campus jobs", "Core requirements", "Majors in Lynch", "Jesuits", "Members of a forced triple", "Brands of parkas", "Workout classes at the plex", "PULSE or 4Boston Placements", "People in a dance group", "Dance groups on campus", "Comedy groups on campus", "People in a comedy group", "Acapella groups on campus", "People in an acapella group", "People in 4Boston", "Languages taught at BC", "Nursing students", "People in Lynch", "People who transferred from BC", "People who transferred to BC", "People with a car on campus", "People with a pet on campus", "Girls who lived on Newton", "Boys who lived on Upper", "Boys who lived on Newton", "Girls who lived on Upper", "Awkward places for a date", "Numbers in the mods", "Artists who performed at BC", "Teams the football team lost to", "Teams the football team beat", "Things pre-meds complain about", "Annoying things people do in O'neill", "Other ACC Universities", "Other Boston schools", "Clubs that fundraise at Chipotle", "Places to get delivery from", "Stops on the green line", "Ways to waste Eagle Bucks", "Employees at the rat", "Toppings for grilled chicken", "People active in the Official Boston College Facebook group", "Sides at Lower", "Places you can get mac & cheese", "Employees at eagles", "Off campus streets", "Parking lots for tailgating", "Drinks from the Chocolate Bar", "Coffees from the rat", "Sandwiches at eagles", "Bus stop locations", "Kinds of salmon from Lower", "Places to watch the Marathon", "BC alumni couples", "Instagrammable buildings", "Things you use a BC id for", "Schools in the Bean Pot", "Athletes", "Freshmen", "Sophomores", "Juniors", "Seniors", "Seniors with a mod", "People who studied in Spain", "People who studied in London", "Famous alumni"]
    
    var lastIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        var selectedIndex: Int!
        repeat {
            selectedIndex = Int(arc4random_uniform(UInt32(threeArray.count)))
        } while selectedIndex == self.lastIndex
        threeLabel.text = threeArray[selectedIndex]
        lastIndex = selectedIndex
    }

    @IBAction func goButtonPressed(_ sender: UIButton) {
        if threeLabel.text?.count == 0 {
            let alertController = UIAlertController(title: "Wait!", message: "Please press 'Name Three' to generate a category before starting the timer.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
        
        performSegue(withIdentifier: "showCountdown", sender: nil)
    }
    
    @IBAction func instructButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "instructSegue", sender: nil)
    }
}
