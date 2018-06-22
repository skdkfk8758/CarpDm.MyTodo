//
//  TodoWriteViewModel.swift
//  CarpDmTodo
//
//  Created by 김동현 on 2018. 6. 22..
//  Copyright © 2018년 CarpDm. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

protocol TodoWriteViewControllerProtocol: UIViewControllerExtension {
    
    var viewModel: TodoWriteViewModel { get }
    
    func dataBindToTodoItem()
}

protocol TodoWriteViewCoordinatorDelegate {
    func showListView()
}

class TodoWriteViewModel {
    
    var coordinator: TodoWriteViewCoordinatorDelegate?
    
    var item = TodoModel()
    
    var subject = Variable<String>("")
    var content = Variable<String>("")
    
    func insert() {
        item.subject = subject.value
        item.contents = content.value
        
        TodoDAO.shared.insert(item: item)
        self.coordinator?.showListView()
    }
}
