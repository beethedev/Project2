//
//  ViewController.swift
//  Project2
//
//  Created by Oluwabusayo Olorunnipa on 6/24/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var noOfPlays = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showScore))
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria",
                    "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    
    

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
        
        // Use code below for Project 2 challenge
        //title = countries[correctAnswer].uppercased() + " Score: \(score)"
        
        
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var printMessage : String
        if sender.tag == correctAnswer {
            title = "Correct"
            printMessage = "You have gained 1 point"
            score += 1
        } else {
            title = "Wrong"
            printMessage =
                """
                    You have lost 1 point.
                    That is the flag for \(countries[sender.tag].uppercased())
                """
            score -= 1
        }
        
        noOfPlays += 1
        if noOfPlays <= 10 {
            let ac = UIAlertController(title: title, message: printMessage, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
            let ac2 = UIAlertController(title: "You have answered 10 questions", message: "Your final score is \(score)", preferredStyle: .alert)
            present(ac2, animated: false)
        }
    }
    
    // Additional code from challenge in Project3
    @objc func showScore() {
        let ac = UIAlertController(title: "Current Score",  message: "\(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: nil))
            present(ac, animated: true)
        
    }
}

