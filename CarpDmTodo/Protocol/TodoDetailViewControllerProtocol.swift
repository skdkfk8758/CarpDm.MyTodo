//
//  TodoDetailViewControllerProtocol.swift
//  CarpDmTodo
//
//  Created by 김동현 on 2018. 6. 17..
//  Copyright © 2018년 CarpDm. All rights reserved.
//

import Foundation
import RxSwift

protocol TodoDetailViewControllerProtocol: UIViewControllerExtension {
    
    var viewModel: TodoDetailViewModel { get }
    
    func dataBindToTodolist()
    
    func actionBindToItemSelect()
}
