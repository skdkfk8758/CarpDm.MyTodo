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

class TodoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchText: UISearchBar!
    @IBOutlet weak var writeTodoModel: UIButton!
    
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
        
        initUI()
        initData()
        initAction()
    }
    
    func initUI() {
        tableView.register(UINib(nibName: TODO_CELL_ID, bundle: nil), forCellReuseIdentifier: TODO_CELL_ID)
    }
    
    func initData() {
        
        dataBindToTodolist()    // Todo 아이템 바인딩
    }
    
    func initAction() {
        actionBindToItemSelect()
    }
}

// MARK: - 기능구현
extension TodoViewController: TodoMainViewControllerProtocol {
    
    func dataBindToTodolist() {
        viewModel.todoItems
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
