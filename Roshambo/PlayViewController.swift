//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Grigory Rudko on 7/6/16.
//  Copyright © 2016 Grigory Rudko. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rockImage = UIImage(named: "rock") as UIImage?
        
        let rockButton = UIButton(type: UIButtonType.Custom) as UIButton
        rockButton.frame = CGRectMake(60, 300, 75, 65)
        rockButton.setImage(rockImage, forState: .Normal)
        self.view.addSubview(rockButton)
        rockButton.addTarget(self, action: #selector(PlayViewController.throwRock), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func opponentPlays() -> Int {
        let randomValue = 1 + arc4random() % 3
        return Int(randomValue)
    }
    
    
    @IBAction func throwRock() {
        var controller: ResultsViewController
        
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        controller.firstValue = self.opponentPlays()
        controller.resultsLabel = UILabel()
        controller.resultsLabel.frame = CGRectMake(60, 250, 300, 60)
        controller.view.addSubview(controller.resultsLabel)
        controller.resultsImageView = UIImageView()
        controller.resultsImageView.frame = CGRectMake(80, 50, 200, 200)
        controller.view.addSubview(controller.resultsImageView)
        
        
        if controller.firstValue == 1 {
            controller.resultsLabel.text = "Rock vs Rock. It’s a Tie!"
            controller.resultsImageView.image = UIImage(named: "itsATie")
            print(controller.firstValue)
            print(controller.resultsLabel.text)
            
        } else if
            controller.firstValue == 2 {
            controller.resultsLabel.text = "Paper covers Rock! Try again..."
            controller.resultsImageView.image = UIImage(named: "PaperCoversRock")
            print(controller.firstValue)
            print(controller.resultsLabel.text)
            
        } else if controller.firstValue == 3 {
            controller.resultsLabel.text = "Rock crushes Scissors. You win!"
            controller.resultsImageView.image = UIImage(named: "RockCrushesScissors")
            print(controller.firstValue)
            print(controller.resultsLabel.text)
            
        } else {
            print("...")
        }
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func throwPaper() {
        performSegueWithIdentifier("paper", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultsViewController
        
        controller.firstValue = self.opponentPlays()
        controller.resultsLabel = UILabel()
        controller.resultsLabel.frame = CGRectMake(60, 250, 300, 60)
        controller.view.addSubview(controller.resultsLabel)
        controller.resultsImageView = UIImageView()
        controller.resultsImageView.frame = CGRectMake(80, 50, 200, 200)
        controller.view.addSubview(controller.resultsImageView)
        
        
        if
            controller.firstValue == 1 && segue.identifier == "paper"  {
            controller.resultsLabel.text = "Paper covers Rock! You win!"
            controller.resultsImageView.image = UIImage(named: "PaperCoversRock")
            
            print(controller.firstValue)
            print(controller.resultsLabel.text)
            
        } else if
            controller.firstValue == 1 && segue.identifier == "scissors"  {
            controller.resultsLabel.text = "Rock crushes Scissors. Try again!"
            controller.resultsImageView.image = UIImage(named: "RockCrushesScissors")
            print(controller.firstValue)
            print(controller.resultsLabel.text)
            
            
        } else if
            controller.firstValue == 2 && segue.identifier == "paper" {
            controller.resultsLabel.text = "Paper vs Paper. It’s a Tie!"
            controller.resultsImageView.image = UIImage(named: "itsATie")
            print(controller.firstValue)
            print(controller.resultsLabel.text)
            
        } else if
            controller.firstValue == 2 && segue.identifier == "scissors" {
            controller.resultsLabel.text = "Scissors cut Paper! You win!"
            controller.resultsImageView.image = UIImage(named: "ScissorsCutPaper")
            print(controller.firstValue)
            print(controller.resultsLabel.text)
            
            
        } else if
            controller.firstValue == 3 && segue.identifier == "paper"  {
            controller.resultsLabel.text = "Scissors cut Paper. Try again!"
            controller.resultsImageView.image = UIImage(named: "ScissorsCutPaper")
            print(controller.firstValue)
            print(controller.resultsLabel.text)
            
        } else if
            controller.firstValue == 3 && segue.identifier == "scissors"  {
            controller.resultsLabel.text = "Scissor Sisters! It's a Tie!"
            controller.resultsImageView.image = UIImage(named: "itsATie")
            print(controller.firstValue)
            print(controller.resultsLabel.text)
            
        } else {
            print("...")
        }
    }
}










