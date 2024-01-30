//
//  Presenter.swift
//  VIPER
//
//  Created by dreaMTank on 2024/01/28.
//

import Foundation

// オブジェクト
//プロトコル
//インタラクター、ルーター、ビューへの参照
enum FetchError: Error {
    case failed
}
protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
}

class UserPresenter: AnyPresenter {
  
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUser()
        }
    }
    
    var view: AnyView?

    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case .success( let users):
            view?.update(with: users)
        case .failure :
            view?.update(with: "Something went wrong")
        }
    }
    
}
