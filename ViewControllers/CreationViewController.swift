//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Leandro Gamarra on 3/6/21.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: firstScreenViewController!
    
    var initialQuestion: String?
    var initialAnswer: String?
    var initialAnswer2: String?
    var initialAnswer3: String?
    
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var answerTextField2: UITextField!
    @IBOutlet weak var answerTextField3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //do any additional setup after loading the view
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
        answerTextField2.text = initialAnswer2
        answerTextField3.text = initialAnswer3
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func didTapOnDone(_ sender: Any) {
        //Get the text in the question text field
        let questionText = questionTextField.text
        
        //Get the text in the answer text field
        let answerText = answerTextField.text
        
        let answerText2 = answerTextField2.text
        
        let answerText3 = answerTextField3.text
        
        //Error message for desired texts
        if questionText == nil || answerText == nil || answerText2 == nil || answerText3 == nil || questionText!.isEmpty || answerText!.isEmpty || answerText2!.isEmpty || answerText3!.isEmpty{
            let alert = UIAlertController(title: "Missing Text", message: "You must put both a question and an answer", preferredStyle: UIAlertController.Style.alert)
            
            present(alert, animated: true)
            
            let okAction = UIAlertAction(title: "ok", style: .default)
            alert.addAction(okAction)
        }
        
        //Call the function to update the flashcard
        else {
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, answer2: answerText2!, answer3: answerText3!)
            
            //dismiss
            dismiss(animated: true)
        }
        
    }
}
