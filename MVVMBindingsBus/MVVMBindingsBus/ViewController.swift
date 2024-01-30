//
//  ViewController.swift
//  MVVMBindingsBus
//
//  Created by dreaMTank on 2024/01/30.
//

import UIKit



class ViewController: UIViewController , UITableViewDataSource{
   
    private var viewModel = UserListViewModel()
    
    
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        
        Bus.shared.subscribeOnMain(.userFetch) {[weak self] event in
            
            guard let result = event.result else {
                return
            }
            switch result {
            case .success(let users):
                self?.viewModel.users = users
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        viewModel.fetchUserList()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = viewModel.users[indexPath.row].name
        return cell
    }
    
   
    
   
    

}

