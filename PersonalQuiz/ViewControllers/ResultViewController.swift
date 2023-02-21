//
//  ViewController.swift
//  PersonalQuiz
//
//  Created by Timur Dzamikh on 21.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        getResult()

    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}

extension ResultViewController {
    private func getResult() {
        let animals = answers.map { $0.animal }
        var animalCount: [Animal: Int] = [:]
        
        for animal in animals {
            if let numberOfAnimalSpecies = animalCount[animal] {
                animalCount[animal] = numberOfAnimalSpecies + 1
            } else {
                animalCount[animal] = 1
            }
        }
        
        let sortedAnimalCount = animalCount.sorted { $0.value > $1.value }
        guard let yourAnimal = sortedAnimalCount.first?.key else { return }
        
        UpdateUI(for: yourAnimal)
    }
    
    private func UpdateUI(for animal: Animal) {
        resultLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.definition
    }
}
