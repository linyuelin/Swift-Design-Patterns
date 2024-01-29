//
//  ViewController.swift
//  MVPDesignPattern
//
//  Created by dreaMTank on 2024/01/28.
//

import UIKit

class UsersViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UserPresenterDelegate{


    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
        
    }()
    
    private var users = [User]()
    private let presenter = UserPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        
        
        //table
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        //Presenter
        //UsersViewControllerが自分自身をUserPresenterのデリゲートとして設定する
        presenter.setViewDelegate(delegate: self)
        presenter.getUsers()
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //ask presenter to handle the tap
        presenter.didTap(user: users[indexPath.row])
    }
    
    //Presenter Delegate
    
    func presentUsers(users: [User]) {
        self.users = users
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    
}

