//
//  TodoDatailViewController.swift
//  CarpDmTodo
//
//  Created by 김동현 on 2018. 6. 17..
//  Copyright © 2018년 CarpDm. All rights reserved.
//

import UIKit
import RxSwift

class TodoDetailViewController: UIViewController {

    internal let viewModel: TodoDetailViewModel
    internal let disposeBag: DisposeBag
    
    init(viewModel: TodoDetailViewModel) {
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
        
        super.init(nibName: TODO_DETAIL_VIEWCONTROLLER_NIB_NAME, bundle: nil)
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
        
    }
    
    func initData() {
        
    }
    
    func initAction() {
        
    }
}

// MARK: - 기능구현
extension TodoDetailViewController: UIViewControllerExtension {
    
}
