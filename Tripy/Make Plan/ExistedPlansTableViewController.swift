//
//  ExistedPlansTableViewController.swift
//  Tripy
//
//  Created by Chris  on 11/12/18.
//  Copyright © 2018 Chris . All rights reserved.
//



import UIKit
final class Todo {
    let title: String
    let date: Date
    var isImportant: Bool
    var isFinished: Bool
    var description: String?
    
    init(title: String ) {
        self.title = title
        self.date = Date()
        self.isImportant = false
        self.isFinished = false
       
    }
}
class ExistedPlansTableViewController: UITableViewController {
    var plans = [Todo]()
    
    @IBAction func addnewplan(_ sender: Any) {
        performSegue(withIdentifier: "makenewplan", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...10 {
            plans.append(Todo(title: "Trip #\(i)"))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        }}
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath:IndexPath) ->
        UISwipeActionsConfiguration?{
            let edit = editFunction(at: indexPath)
            let delete = deleteFunction(at: indexPath)
            return UISwipeActionsConfiguration(actions: [delete, edit])
            
    }
    
    func editFunction(at indexPath: IndexPath) -> UIContextualAction{
        //performSegue(withIdentifier: "tomakeplan", sender: self)
        let todo = plans[indexPath.row]
        let action = UIContextualAction(style: .normal, title:"important") {(action, view, completion) in todo.isImportant = !todo.isImportant
            completion(true)
        }
        action.image = UIImage(named:"edit")
        action.backgroundColor = todo.isImportant ? .purple : .gray
        return action
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "tomakenewplan" {
//            _ = segue.destination as! ExistedPlansTableViewController
//
    //        }}
    
    
    
    func deleteFunction(at indexPath: IndexPath) ->UIContextualAction {
    let action = UIContextualAction(style: .destructive, title: "Delete") {(action,view,completion) in
        self.plans.remove(at: indexPath.row)
        self.tableView.deleteRows(at:[indexPath], with: .automatic)
        completion(true)
    }
    action.image = UIImage(named:"delete")
    action.backgroundColor = .red
    return action
}


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return plans.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        
        // Configure the cell...
        let plan = plans[indexPath.row]
        cell.textLabel?.text = plan.title
        cell.detailTextLabel?.text = plan.date.description
        
        return cell
    }

//    @IBAction func viewplan(_ sender: Any) {
//        performSegue(withIdentifier: "viewplan", sender: self)
//    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}

