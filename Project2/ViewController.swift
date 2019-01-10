//
//  ViewController.swift
//  Project2
//
//  Created by Gavin Brown on 1/10/19.
//  Copyright © 2019 DevelopIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries : [String] = []
    var correctAnswer = 0
    var score: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor //borderColor belongs to CGLayer  their for we must add .cgColor at the end
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) { // must add a UIAlertAction param to say which button was tapped
        
        countries.shuffle() // returns in place shuffling --- .shuffled() returns a new array with shuffled points
        
        button1.setImage(UIImage(named: countries[0]), for: .normal) // setImage assings a UIImage to a button
        button2.setImage(UIImage(named: countries[1]), for: .normal) //.normal describes state of button like highlighted and disabled
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2) //generates a random number in a range of 0 - 2(inclusive of both ends)
        title = countries[correctAnswer].uppercased()
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true) // ac is viewcontroller to present
    }
    
}

