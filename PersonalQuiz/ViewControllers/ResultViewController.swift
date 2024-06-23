//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.08.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    // MARK: - Properties
    var answersChosen: [Answer]!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResults()
    }
    
    // MARK: - Actions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // MARK: - Deinitialization
    deinit {
        print("\(type(of: self)) has been deallocated")
    }

    // MARK: - Private Methods
    private func calculateResults() {
        let answersCount = answersChosen.reduce(into: [Animal: Int]()) {
            counts, answer in
            counts[answer.animal, default: 0] += 1
        }
        
        if let answersResult = answersCount.max(by: { a, b in a.value < b.value }) {
            let resultAnimal = answersResult.key
            updateUI(with: resultAnimal)
        }
    }
    
    private func updateUI(with animal: Animal) {
        titleLabel.text = "Вы - \(animal.rawValue)!"
        definitionLabel.text = animal.definition
    }
    
}
