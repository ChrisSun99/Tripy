//
//  ExistedPlansTableViewController.swift
//  Tripy
//
//  Created by Chris  on 11/12/18.
//  Copyright © 2018 Chris . All rights reserved.
//



import UIKit
import Firebase
import FirebaseDatabase

class ExistedPlansTableViewController: UITableViewController {
    var plans = MockData.createMockTripModelData()
    var ref = Database.database().reference()
    var databaseHandle: DatabaseHandle?

    
    //var plans = Data.tripModels
    var tripIndexToEdit: Int?
   
    @IBOutlet weak var addButton: UIButton!

    
  
    @IBOutlet var mytableView: UITableView?
    

    var tripfunctions = TripFunctions()
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.mytableView?.reloadData()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPost()
        tripfunctions.readTrips(completion:  { [weak self] in
            self?.mytableView?.reloadData()
        })
        
        mytableView?.dataSource = self
        mytableView?.delegate = self
//       for i in 1...3 {
//        plans.append(TripModel(name: "Trip #\(i)"))}
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
}
    func loadPost(){
        ref.child("Posts").observe(.childAdded) { (snapshot: DataSnapshot) in
            if let dict = snapshot.value as? [String: Any] {

            }
            
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripsViewController
            popup.tripIndexToEdit = self.tripIndexToEdit
            popup.doneSaving = { [weak self] in
                self?.mytableView?.reloadData()
            }
        }
    }

    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath:IndexPath) ->
        UISwipeActionsConfiguration?{
            let edit = editFunction(at: indexPath)
            let delete = deleteFunction(at: indexPath)
            return UISwipeActionsConfiguration(actions: [delete, edit])
            
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 160 
    }
    
    func editFunction(at indexPath: IndexPath) -> UIContextualAction{

    
        let action = UIContextualAction(style: .normal, title: "Edit") {(action, view, completion)  in
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "ToMakeANewPlan", sender: nil)
            
        }
        
        action.backgroundColor = .gray
        return action
    }
        
//        let todo = plans[indexPath.row]
//        let action = UIContextualAction(style: .normal, title:"important") {(action, view, completion) in todo.isImportant = !todo.isImportant
//            completion(true)
//        }
//        action.image = UIImage(named:"edit")
//
//        action.backgroundColor = todo.isImportant ? .purple : .gray
//        return action
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "tomakenewplan" {
//            _ = segue.destination as! ExistedPlansTableViewController
//
    //        }}
    
    
    
    func deleteFunction(at indexPath: IndexPath) ->UIContextualAction {
    let action = UIContextualAction(style: .destructive, title: "Delete") {(action,view,completion) in
        self.plans.remove(at: indexPath.row)
        self.mytableView?.deleteRows(at:[indexPath], with: .automatic)
        completion(true)
    }
    //action.image = UIImage(named:"delete")
    
    action.backgroundColor = .red
    return action
}


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return plans.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! ExistedPlansTableViewCell
        
        // Configure the cell...
       let plan = plans[indexPath.row]
//        if cell != nil {
//            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "TodoCell")
//        }
        
        cell.TripTitle.textColor = .black
        cell.TripTitle.text = plan.name
        cell.imageView?.image = plan.image
        cell.imageView?.alpha = 0.5
        cell.cardView.layer.cornerRadius = 10
        cell.cardView.layer.shadowColor = UIColor.darkGray.cgColor
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let trip = Data.tripModels[indexPath.row]
//        let storyboard = UIStoryboard(name: String(describing: ViewPlanViewController.self), bundle: nil)
//        let vc = storyboard.instantiateInitialViewController() as! ViewPlanViewController
//        vc.tripId = trip.id
//        
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

