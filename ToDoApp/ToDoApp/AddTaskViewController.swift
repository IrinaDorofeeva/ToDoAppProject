//
//  AddTaskViewController.swift
//  ToDoApp
//
//  Created by Mac on 4/28/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit



class AddTaskViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true);
        return false;
    }
    
    @IBOutlet weak var addTaskText: UITextField!
    
    @IBOutlet weak var isImportantSwitch: UISwitch!
    
    @IBAction func addTaskButton(_ sender: UIButton) {
        
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let task = Task(context: context)
    task.taskName = addTaskText.text!
    task.isImportant = isImportantSwitch.isOn
     //Save the data
        
     (UIApplication.shared.delegate as! AppDelegate).saveContext()
      
     navigationController!.popViewController(animated: true)
        
        
    }
    
    
    

   
}
