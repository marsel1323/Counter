//
//  ViewController.swift
//  Counter
//
//  Created by mnabdrakhmanov on 07.11.2024.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!

    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTextView.isEditable = false
    }

    @IBAction func increaseButtonDidTap(_ sender: Any) {
        updateCounter(by: 1)
    }
    
    @IBAction func decreaseButtonDidTap(_ sender: Any) {
        if counter > 0 {
            updateCounter(by: -1)
        } else {
            updateHistory(with: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func resetButtonDidTap(_ sender: Any) {
        counter = 0
        updateLabel()
        updateHistory(with: "значение сброшено")
    }
    
    func updateCounter(by amount: Int) {
        counter += amount
        updateLabel()
        let message = amount > 0 ? "значение изменено на +\(amount)" : "значение изменено на \(amount)"
        updateHistory(with: message)
    }
    
    var labelText: String {
        return "Значение счётчика: \(counter)"
    }
    
    func updateLabel() {
        counterLabel.text = labelText
    }
    
    func formattedTimestamp(date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
    func updateHistory(with message: String) {
        let timestamp = formattedTimestamp(date: Date())
        let newEntry = "\n[\(timestamp)]: \(message)"
        historyTextView.text.append(newEntry)
        historyTextView.scrollRangeToVisible(NSRange(location: historyTextView.text.count - 1, length: 1))
    }
}

