//
//  ViewController.swift
//  Flashcards
//
//  Created by Leandro Gamarra on 2/20/21.
//

import UIKit

class ViewController: UIViewController {

    
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
    
}
