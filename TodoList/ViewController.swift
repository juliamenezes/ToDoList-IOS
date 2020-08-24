//
//  ViewController.swift
//  TodoList
//
//  Created by COTEMIG on 17/08/20.
//  Copyright © 2020 Cotemig. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var todoList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    @IBAction func addTask(_ sender: Any) {
        let alert = UIAlertController(
            title: "Add Task",
            message: "Add a new Task:",
            preferredStyle: .alert
        )
        
        let actionSave = UIAlertAction(
            title: "Save",
            style: .default
            ) { (action) in
                if let textField = alert.textFields?.first, let text = textField.text {
                    self.todoList.append(text)
                    self.tableView.reloadData()
                }
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(actionSave)
        alert.addAction(actionCancel)
        
        alert.addTextField()
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = todoList[indexPath.row]
        return cell
    }
}

