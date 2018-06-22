//
//  TodoWriteViewController.swift
//  CarpDmTodo
//
//  Created by 김동현 on 2018. 6. 22..
//  Copyright © 2018년 CarpDm. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TodoWriteViewController: UIViewController {

    @IBOutlet weak var subject: UITextField!
    @IBOutlet weak var contents: UITextView!
    
    let viewModel: TodoWriteViewModel
    let disposeBag: DisposeBag
    
    init(viewModel: TodoWriteViewModel) {
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
        
        super.init(nibName: TODO_WRITE_VIEWCONTROLLER_NIB_NAME, bundle: nil)
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
        createNavigationItem()
    }
    
    func initData() {
        dataBindToTodoItem()
    }
    
    func initAction() {
        
    }
}

extension TodoWriteViewController: TodoWriteViewControllerProtocol {
    func dataBindToTodoItem() {
        (subject as? UITextField)?.rx.text.map{ $0 ?? "" }.bind(to: self.viewModel.subject)
        (contents as? UITextView)?.rx.text.map{ $0 ?? "" }.bind(to: self.viewModel.content)
    }
}

extension TodoWriteViewController {
    func createNavigationItem() {
        var writeTodoButton = UIBarButtonItem().insertButton()
        
        (writeTodoButton as? UIBarButtonItem)?.rx.tap.bind { self.viewModel.insert() }
        
        self.navigationItem.setRightBarButtonItems([writeTodoButton], animated: true)
    }
}
