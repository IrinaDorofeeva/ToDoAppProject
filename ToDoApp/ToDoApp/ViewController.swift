//
//  ViewController.swift
//  ToDoApp
//
//  Created by Mac on 4/28/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!

    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        
        
        if task.isImportant{
            cell.textLabel?.textColor = UIColor.red
        cell.textLabel?.text = "\(task.taskName!) ❁"}
        else{
        cell.textLabel?.text = task.taskName
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return tasks.count
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete{
        let task = tasks[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            getData()
            tableView.reloadData()
        }
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        // get the data from core data
        getData()
        //reload the data from core data
        tableView.reloadData()
    }

    
    func getData(){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
       do{
        tasks = try context.fetch(Task.fetchRequest())
        }
       catch{
       print("Fetching Failed")
        }
        
    }
    
    

}

