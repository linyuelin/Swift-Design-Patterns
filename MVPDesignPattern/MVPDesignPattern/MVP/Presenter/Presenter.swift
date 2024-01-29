//
//  Presenter.swift
//  MVPDesignPattern
//
//  Created by dreaMTank on 2024/01/28.
//

import Foundation
import UIKit

protocol UserPresenterDelegate: AnyObject {
    func presentUsers(users: [User])
    func presentAlert(title: String , message: String)
}

// デリゲートは二つのプロトコルを準拠することを表明する
typealias PresenterDelegate = UserPresenterDelegate & UIViewController

class UserPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func getUsers() {
        // ユーザーデータの取得用URLを作成
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return}
        
        //URLSessionを使用して非同期でデータを取得するタスクを作成
        let  task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            // エラーが発生した場合処理を中断
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //　JSONデータをデコードしてUser構造体の配列に変換
                let users = try JSONDecoder().decode([User].self, from: data)
                
                //成功時、デリゲートを通じてUsersViewControllerにユーザーデータを通知
                self?.delegate?.presentUsers(users: users)
            }
            catch {
                //デコードエラーが発生した場合はエラーをコンソールに表示
                print(error)
            }
        }
        
        // データ取得タスク開始
        task.resume()
    }
    
    //　デリゲートの付与
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    
    public func  didTap(user: User){
//        delegate?.presentAlert(title: user.name, message: "\(user.name) has an email of \(user.email) & a       username of \(user.username)")
        
        let  title =  user.name
        let  message = "\(user.name) has an email of \(user.email) & a username of \(user.username)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        delegate?.present(alert, animated: true)
        
    }
}
