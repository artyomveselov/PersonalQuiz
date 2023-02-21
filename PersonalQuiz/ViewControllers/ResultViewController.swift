//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        getAnimal()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

private extension ResultViewController {
    func getAnimal() {
        var recountOfAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        for animal in animals {
            if let animalType = recountOfAnimals[animal] {
                recountOfAnimals.updateValue(animalType + 1, forKey: animal)
            } else {
                recountOfAnimals[animal] = 1
            }
        }
        let sortedAnimal = recountOfAnimals.sorted { $0.value > $1.value }
        guard let resultAnimal = sortedAnimal.first?.key else { return }
        updateUI(resultAnimal)
    }

    func updateUI(_ animal: Animal) {
        animalLabel.text = "Вы - \(animal.rawValue)!"
        definitionLabel.text = animal.definition
    }
}
