//
//  TodoDetailViewModel.swift
//  CarpDmTodo
//
//  Created by 김동현 on 2018. 6. 17..
//  Copyright © 2018년 CarpDm. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

protocol TodoDetailViewControllerProtocol: UIViewControllerExtension {
    
    var viewModel: TodoDetailViewModel { get }
    
    func dataBindToTodo()
}

class TodoDetailViewModel {
    
    lazy var item: Variable<TodoModel> = Variable(TodoModel())
    
    init(item: TodoModel) {
        self.item.value = item
    }
}
