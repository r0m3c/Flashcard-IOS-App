//
//  ViewController.swift
//  Flashcards
//
//  Created by Leandro Gamarra on 2/20/21.
//

import UIKit

class firstScreenViewController: UIViewController {
    
    @IBOutlet weak var Card: UIView!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var Card1: UIView!
    @IBOutlet weak var backWrong: UILabel!
    @IBOutlet weak var frontLincoln: UILabel!
    
    @IBOutlet weak var Card2: UIView!
    @IBOutlet weak var backWrong2: UILabel!
    @IBOutlet weak var frontSchind: UILabel!
    
    @IBOutlet weak var Card3: UIView!
    @IBOutlet weak var backWrong3: UILabel!
    @IBOutlet weak var frontPortrait: UILabel!
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        updateLabels()
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        //Increase current Index
        currentIndex = currentIndex + 1
        
        //update labels
        updateLabels()
        
        //update buttons
        updateNextPrevButtons()
    }
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func didTapOnDelete(_ sender: Any) {
        //show confirmation of deletion
        let alert = UIAlertController(title: "Delete Flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) {action in self.deleteCurrentFlashcard()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func deleteCurrentFlashcard() {
        //delete current flashcard
        flashcards.remove(at: currentIndex)
        
        //special case: check if last flashcard was deleted
        if currentIndex > flashcards.count - 1 {
            currentIndex = flashcards.count - 1
        }
        
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
    }
    
    //Array to hold our flashcards
    var flashcards = [Flashcard]()
    
    //Current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Card.layer.cornerRadius = 40.0;
        Card.layer.shadowRadius = 70.0;
        Card.layer.shadowOpacity = 4.0;
        frontLabel.clipsToBounds = true;
        backLabel.clipsToBounds = true;
        frontLabel.layer.cornerRadius = 40.0
        backLabel.layer.cornerRadius = 40.0
        frontLabel.layer.shadowRadius = 100.0;
        
        Card1.layer.cornerRadius = 40.0;
        Card1.layer.shadowRadius = 70.0;
        Card1.layer.shadowOpacity = 4.0;
        frontLincoln.clipsToBounds = true;
        backWrong.clipsToBounds = true;
        frontLincoln.layer.cornerRadius = 40.0
        backWrong.layer.cornerRadius = 40.0
        frontLincoln.layer.shadowRadius = 100.0;
        
        Card2.layer.cornerRadius = 40.0;
        Card2.layer.shadowRadius = 70.0;
        Card2.layer.shadowOpacity = 4.0;
        frontSchind.clipsToBounds = true;
        backWrong2.clipsToBounds = true;
        frontSchind.layer.cornerRadius = 40.0
        backWrong2.layer.cornerRadius = 40.0
        frontSchind.layer.shadowRadius = 100.0;
        
        Card3.layer.cornerRadius = 40.0;
        Card3.layer.shadowRadius = 70.0;
        Card3.layer.shadowOpacity = 4.0;
        frontPortrait.clipsToBounds = true;
        backWrong3.clipsToBounds = true;
        frontPortrait.layer.cornerRadius = 40.0
        backWrong3.layer.cornerRadius = 40.0
        frontPortrait.layer.shadowRadius = 100.0;
        
        //read saved files
        readSavedFlashcards()
        
        //adding our initial flashcard if needed
        if flashcards.count == 0 {
            updateFlashcard(question: "What's my favorite film?", answer: "Lincoln", answer2: "Schindler's List", answer3: "Portrait of a Lady on Fire")
        }
        else {
            updateLabels()
            updateNextPrevButtons()
        }
        }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        backLabel.isHidden = true
    }
    
    @IBAction func didTaponFlashcard1(_ sender: Any) {
        frontLincoln.isHidden =  true;
    }
    
    @IBAction func didTaponFlashcard2(_ sender: Any) {
        if (frontSchind.isHidden == false) {
            frontSchind.isHidden = true;
            return;
        }
        else if (frontSchind.isHidden == true) {
            frontSchind.isHidden = false;
        }
        }

    @IBAction func didTaponFlashcard3(_ sender: Any) {
        frontPortrait.isHidden = true;
    }
    
    struct Flashcard {
        var question: String
        var answer: String
        var answer2: String
        var answer3: String
    }
    
    
    func updateFlashcard(question: String, answer: String, answer2: String, answer3: String) {
        
        let flashcard = Flashcard(question: question, answer: answer, answer2: answer2, answer3: answer3)
        
            //adding flashcard in the flashcards array
            flashcards.append(flashcard)
            
            //logging to the console
            print("Added new Flashcard")
            
            //update current index
            currentIndex = flashcards.count - 1
            print("We now have \(flashcards.count) flashcards")
        
        //update buttons
        updateNextPrevButtons()
        
        //update Labels
        updateLabels()
        
        //call saveAllFlashcardsToDisk
        saveAllFlashcardsToDisk()
   }
    
    func updateNextPrevButtons() {
        //disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        }
        else {
            nextButton.isEnabled = true
        }
        
        //disable prev Button if at the beginning
        if currentIndex == 0 {
            prevButton.isEnabled = false
        }
        else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels() {
        //get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        //Update labels
        frontLabel.text = currentFlashcard.question
        frontSchind.text = currentFlashcard.answer
        frontLincoln.text = currentFlashcard.answer2
        frontPortrait.text = currentFlashcard.answer3
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //We know the destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        //We know the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        //we set the flashcardsController property to self
        creationController.flashcardsController = self
        
        //for edit button
        if segue.identifier == "EditSegue" {
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = frontSchind.text
            creationController.initialAnswer2 = frontLincoln.text
            creationController.initialAnswer3 = frontPortrait.text
        }
    }
    
    func saveAllFlashcardsToDisk() {
        //from flashcard array to dictionary array
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer, "answer2": card.answer2, "answer3": card.answer3]
        }
        
        //save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        //log it
        print ("Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards() {
        //read dictionary array from disk (if any)
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String:String]]{
            //in here we know for sure we have a dictionary array
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, answer2: dictionary["answer2"]!, answer3: dictionary["answer3"]!)
            }
            //put all these cards in our flashcards array
            flashcards.append(contentsOf: savedCards)
            }
            }
        }
        

