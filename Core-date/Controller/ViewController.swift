//
//  ViewController.swift
//  Core-date
//
//  Created by aunogarafat on 5/25/18.
//  Copyright © 2018 aunogarafat. All rights reserved.
//

import UIKit
import CoreData

let appDeleGate =  UIApplication.shared.delegate as? AppDelegate

class ViewController: UIViewController {
    var goals: [Goal] = []

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        let nib = UINib.init(nibName: "MyCustomCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "MyCustomCell")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fecthGoalData()
        tableView.reloadData()
    }
    func fecthGoalData()  {
        self.fetch { (completion) in
            if completion {
                if goals.count >= 1 {
                    tableView.isHidden = false
                   
                }else {
                    tableView.isHidden = true
                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addGoalButton(_ sender: Any) {
        guard let createGoal = storyboard?.instantiateViewController(withIdentifier: "CreateGoal") else {
            return
        }
        presentDetail(_viewControllerToPrsent: createGoal)
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell") as? MyCustomCell else {
            return UITableViewCell()}
      
        
        let goal = goals[indexPath.row]
        cell.type.text = goal.goalType
        cell.desc.text = goal.goalDescripption
        cell.getupdating.text = String (goal.goalProgress)
        if goal.goalProgress ==  goal.goalCompletionValue {
            cell.completionView.isHidden = false
        }else{
            cell.completionView.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deletAction = UITableViewRowAction(style: .destructive, title: "Delete") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fecthGoalData()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
           
        }
        let addAction = UITableViewRowAction(style: .normal, title: "Add") { (rowAction, indexPath) in
            self.set(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        }
        deletAction.backgroundColor = #colorLiteral(red: 1, green: 0.1178421161, blue: 0.2507044377, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        return [deletAction,addAction]
    }
   
}

extension ViewController {
    func set(atIndexPath indexPath : IndexPath )  {
         guard let managedContext = appDeleGate?.persistentContainer.viewContext else {return}
        
        let chosengoal = goals[indexPath.row]
        if chosengoal.goalProgress < chosengoal.goalCompletionValue {
            chosengoal.goalProgress =             chosengoal.goalProgress + 1
        } else {
            return
        }
        do {
            try managedContext.save()
            print("goalprogress")
        } catch  {
            debugPrint("could not goalprogress \(error.localizedDescription)")
        }
    }
    func fetch(completion: (_ complete: Bool) -> ()){
        guard let managedContext = appDeleGate?.persistentContainer.viewContext else {return}
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        
        do {
            goals =  try managedContext.fetch(fetchRequest) as! [Goal]
            print("fetch")
            completion(true)
        } catch  {
            debugPrint("could not fetch \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func removeGoal(atIndexPath indexPath : IndexPath){
        guard let managedContext = appDeleGate?.persistentContainer.viewContext else {return}
        managedContext.delete(goals[indexPath.row])
        do {
            try managedContext.save()
            print("remove")
        } catch  {
              debugPrint("could not remove \(error.localizedDescription)")
        }
        
    }
    
}
















