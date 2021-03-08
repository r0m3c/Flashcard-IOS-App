//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Leandro Gamarra on 3/6/21.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: firstScreenViewController!
    
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func didTapOnDone(_ sender: Any) {
        //Get the text in the question text field
        let questionText = questionTextField.text
        
        //Get the text in the answer text field
        let answerText = answerTextField.text
        
        //Call the function to update the flashcard
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
        
        //dismiss
        dismiss(animated: true)
    }
}
