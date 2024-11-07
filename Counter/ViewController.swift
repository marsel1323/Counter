//
//  ViewController.swift
//  Counter
//
//  Created by mnabdrakhmanov on 07.11.2024.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0
    
    @IBOutlet weak var counterButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func countButtonDidTap(_ sender: Any) {
        counter += 1
        updateLabel()
    }
    
    func updateLabel() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
}

