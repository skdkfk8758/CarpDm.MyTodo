//
//  TodoViewController.swift
//  CarpDmTodo
//
//  Created by 김동현 on 2018. 6. 17..
//  Copyright © 2018년 CarpDm. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RealmSwift

class TodolistViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchText: UISearchBar!
    
    internal let viewModel: TodoMainViewModel
    internal let disposeBag: DisposeBag
    
    init(viewModel: TodoMainViewModel) {
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
        
        super.init(nibName: TODO_MAIN_VIEWCONTROLLER_NIB_NAME, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.delegate = self
        
        initUI()
        initData()
        initAction()
    }
    
    func initUI() {
        tableView.register(UINib(nibName: TODO_CELL_ID, bundle: nil), forCellReuseIdentifier: TODO_CELL_ID)
        
        createNavigationItem()
    }
    
    func initData() {
        dataBindToTodolist()    // Todo 아이템 바인딩
    }
    
    func initAction() {
        actionBindToItemSelect()    // Todo 아이템 선택 이벤트
    }
}

// MAR트: - 기능구현
extension TodolistViewController: TodoMainViewControllerProtocol {
    
    func dataBindToTodolist() {
        viewModel.items
            .bind(to: tableView.rx.items(cellIdentifier: TODO_CELL_ID)) { index, item, cell in
                (cell as? TodoCell)?.set(item: item)
        }
    }
    
    func actionBindToItemSelect() {
        tableView.rx.modelSelected(TodoModel.self)
            .subscribe(onNext: { (item) in
                self.viewModel.coordinator?.showDetail(item: item)
            }).disposed(by: disposeBag)
    }
}

// 추가함수
extension TodolistViewController {
    func createNavigationItem() {
        var writeTodoButton = UIBarButtonItem().insertButton()
        var removeAllTodoButton = UIBarButtonItem().removeAllButton()
        
        (writeTodoButton as? UIBarButtonItem)?.rx.tap.bind { self.viewModel.coordinator?.showWriteView() }
        
        self.navigationItem.setRightBarButtonItems([writeTodoButton, removeAllTodoButton], animated: true)
    }
}

/*
    네비게이션 컨트롤러 델리게이트
 */
extension TodolistViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print("1")
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
    }
}
