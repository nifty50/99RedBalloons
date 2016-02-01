//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Ansel Adams on 1/31/16.
//  Copyright © 2016 Ansel Adams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var balloonsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var currentBalloon = 0
    
    var balloons:[Balloon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.create99Balloons()
        
        self.balloonsLabel.text = "\(balloons[currentBalloon].number) balloon"
        self.imageView.image = balloons[currentBalloon].image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        var randomNumber:Int
        repeat {
            randomNumber = Int(arc4random_uniform(UInt32(99)))
        } while randomNumber == self.currentBalloon
        self.currentBalloon = randomNumber
        self.balloonsLabel.text = "\(balloons[randomNumber].number) balloon"
        self.imageView.image = balloons[randomNumber].image
    }
    
    func create99Balloons() {
        for var i = 1; i < 100; i += 1 {
            let randomNumber = Int(arc4random_uniform(UInt32(4)))
            var balloon = Balloon()
            balloon.number = i
            print("Random number was \(randomNumber)")
            switch randomNumber {
            case 0:
                balloon.image = UIImage(named: "RedBalloon1.jpg")
            case 1:
                balloon.image = UIImage(named: "RedBalloon2.jpg")
            case 2:
                balloon.image = UIImage(named: "RedBalloon3.jpg")
            case 3:
                balloon.image = UIImage(named: "RedBalloon4.jpg")
            default:
                balloon.image = UIImage(named: "RedBalloon1.jpg")
            }
            print("Balloon \(balloon.number) created with image \(balloon.image)")
            balloons.append(balloon)
        }
    }

}

