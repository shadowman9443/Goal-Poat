//
//  CreateGoalViewController.swift
//  Core-date
//
//  Created by aunogarafat on 5/26/18.
//  Copyright © 2018 aunogarafat. All rights reserved.
//

import UIKit

class CreateGoalViewController: UIViewController , UITextViewDelegate{

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermbtn: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindKeyBoard();
        shortTermbtn.selectedColour()
        longTermButton.deselectedColour()
        goalTextView.delegate = self

    }

   
    @IBAction func shrttrmPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermbtn.selectedColour()
        longTermButton.deselectedColour()
    }
    
    
    @IBAction func lngtrmPressed(_ sender: Any) {
        goalType = .longTerm
        longTermButton.selectedColour()
        shortTermbtn.deselectedColour()

    }
    
    
    
    @IBAction func NextBtnPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal? " {
            guard let finishGoalVc = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else {return}
            finishGoalVc.initData(desc: goalTextView.text! , type: goalType)
           // presentDetail(_viewControllerToPrsent: finishGoalVc)
            presentingViewController?.prsentSecendarDetail(finishGoalVc)
        }
    }
    
    
    @IBAction func bckbtnPressed(_ sender: Any) {
        dissMiss()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }

    
}
