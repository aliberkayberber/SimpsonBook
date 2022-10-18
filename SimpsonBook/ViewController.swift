//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Ali Berkay BERBER on 18.10.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    var mySimpson = [Simpson]()
    var chosenSimpson : Simpson?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // simpson class
        
      let homer = Simpson(simpsonName: "Homer", simpsonJob: "Nuclear safety", simpsonImage: UIImage(named: "homer")!)
     
        let marge = Simpson(simpsonName: "Marge", simpsonJob: "House Wife", simpsonImage: UIImage(named: "marge")!)
        let bart = Simpson(simpsonName: "Bart", simpsonJob: "Student", simpsonImage: UIImage(named: "bart")!)
        let lisa = Simpson(simpsonName: "Lisa", simpsonJob: "Student", simpsonImage: UIImage(named: "lisa")!)
        let maggie = Simpson(simpsonName: "Maggie", simpsonJob: "Baby", simpsonImage: UIImage(named: "maggie")!)
        
        mySimpson.append(homer)
        mySimpson.append(marge)
        mySimpson.append(bart)
        mySimpson.append(lisa)
        mySimpson.append(maggie)
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = UITableViewCell()
            var content = cell.defaultContentConfiguration()
            content.text = mySimpson[indexPath.row].name
            cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenSimpson = mySimpson[indexPath.row]
        
        
        self.performSegue(withIdentifier: "detailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsVC" {
            let destinationVC = segue.destination as! detailsVC
            
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
}

