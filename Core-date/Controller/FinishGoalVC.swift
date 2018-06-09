//
//  FinishGoalVC.swift
//  Core-date
//
//  Created by aunogarafat on 5/28/18.
//  Copyright © 2018 aunogarafat. All rights reserved.
//

import UIKit
import CoreData


class FinishGoalVC: UIViewController , UITextFieldDelegate{
    
    
    @IBOutlet weak var pointsTextField: UITextField!
    
    @IBOutlet weak var createGoalbtn: UIButton!
    
    var gDesc: String!
    var gtype : GoalType!
    
    func initData(desc:String, type: GoalType)  {
        self.gDesc = desc
        self.gtype = type
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalbtn.bindKeyBoard()
        pointsTextField.delegate = self
        // Do any additional setup after loading the view.
    }

   
    @IBAction func createGoalbtnPrsd(_ sender: Any) {
        if( pointsTextField.text != "" ){
            self.save { (comlete) in
                if comlete {
                    dissMiss()
                }
            }
        }
    }
    
    @IBAction func bckbtnPressed(_ sender: Any) {
        dissMiss()
    }
    func save(completion: (_ finished :Bool) -> ()) {
        guard let managedContext = appDeleGate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        goal.goalDescripption = gDesc
        goal.goalType = gtype.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            print("saved")
            completion(true)
        } catch {
            debugPrint("Could not save :\(error.localizedDescription)")
            completion(false)
        }
        
        
    }
}
