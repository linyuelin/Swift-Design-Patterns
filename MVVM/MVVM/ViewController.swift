//
//  ViewController.swift
//  MVVM
//
//  Created by dreaMTank on 2024/01/30.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var data = [
       Person(firstName: "川端", lastName: "康成", gender: "male", age: 100, height: 180),
       Person(firstName: "芥川", lastName: "龍之介", gender: "male", age: 100, height: 180),
       Person(firstName: "大江", lastName: "健太郎", gender: "male", age: 100, height: 180),
    ]
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        let model = data[indexPath.row]
    
        cell.configure(with: CellViewModel(firstName: model.firstName, lastName: model.lastName))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }


}


struct Person {
    let firstName: String
    let lastName: String
    let gender: String
    let age: Int
    let height: Double
}

struct CellViewModel {
    let firstName: String
    let lastName: String
}
