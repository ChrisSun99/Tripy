//
//  ViewPlanViewController.swift
//  Tripy
//
//  Created by Chris  on 11/12/18.
//  Copyright © 2018 Chris . All rights reserved.
//

import UIKit



class ViewPlanViewController: UITableViewController {
    var tripId: UUID!
    var tripModel: TripModel?
    @IBAction func Goback(_ sender: Any) {
        performSegue(withIdentifier: "ToExistedPlans", sender: self)
    }
    
    let cellId = "cellId"

    
    var twoDimensionalArray = [
        ExpandableNames(isExpanded: true, names: ["Gong Cha", "Berkeley", "Ttoust"]),
        ExpandableNames(isExpanded: true, names: [ "Golden-Gate Bridge", "Twin Peaks", "Boba Guys"]),
        ExpandableNames(isExpanded: true, names:  ["SFMOMA", "Westfield"]),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        // Do any additional setup after loading the view.
        
//        TripFunctions().readTrip(by: tripId) { [weak self] (model) in
//            guard let myself = self else {return}
//            myself.tripModel = model
//        }
        
    }
    
   
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let button = UIButton(type: .system)

        button.backgroundColor = .blue
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleExpandClose), for: .touchUpInside)
        button.tag = section
        
        button.setTitle("Day \(section + 1)", for: .normal)
       
        
        return button
    
       

    }
    
    
    @objc func handleExpandClose(button: UIButton){
        var indexPaths = [IndexPath]()

        let section = button.tag
       
        for row in twoDimensionalArray[section].names.indices  {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
            }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
       // button.setTitle(isExpanded ? "Open": "Close", for: .normal)
        if isExpanded{
             tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
        

            tableView.insertRows(at: indexPaths, with: .fade)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        if !twoDimensionalArray[section].isExpanded {  //is closed 
            return 0
        }
        return twoDimensionalArray[section].names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//            let name = self.names[indexPath.row]
//            let name = indexPath.section == 0 ? names[indexPath.row] :
//                anothernames[indexPath.row]
            let name = twoDimensionalArray[indexPath.section].names[indexPath.row]
            cell.textLabel?.text = name
            return cell
    }
    
  
}
//    extension ViewPlanViewController  {
//        override func numberOfSections(in tableView: UITableView) -> Int {
//            return tripModel?.dayModel.count ?? 0 ?? 1 ?? 2
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


