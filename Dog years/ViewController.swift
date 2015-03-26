//
//  ViewController.swift
//  Dog years
//
//  Created by Oliver Kovacs on 11/03/15.
//
//

import UIKit

class ViewController: UIViewController {

    let dog = Dog()
    let dogType = DogType.Medium
    
    @IBOutlet weak var dateField: UIDatePicker!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var dogTypeSegment: UISegmentedControl!
    
    @IBAction func calcAge(sender: UIButton) {
        let timeIntervalSinceNow = dateField.date.timeIntervalSinceNow

        // Time interval should be negative if the current date is bigger than the selected.
        if timeIntervalSinceNow.isSignMinus {
            // Time interval contains seconds since the selected date. Naive convert to year
            let age = -1 * Int(timeIntervalSinceNow / 60 / 60 / 24 / 365)
            let selectedDogType = dogTypeSegment.titleForSegmentAtIndex(dogTypeSegment.selectedSegmentIndex) ?? dogType.description
            
            // Expected dog lifespan is a closed range.
            // Use the pattern match operator to see if it contains the requested dog age
            if age > 0 && age < dog.expectedDogLifeSpan {
                if let humanAge = dog.ageForDog(dogType.getFromString(selectedDogType), age: age) {
                    resultLabel.text = "\(age) / \(humanAge)"
                }
            }
        }
    }

}

