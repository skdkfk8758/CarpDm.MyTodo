//
//  TodoMainCoordinator.swift
//  CarpDmTodo
//
//  Created by 김동현 on 2018. 6. 17..
//  Copyright © 2018년 CarpDm. All rights reserved.
//

import Foundation

final class TodoMainCoordinator: Coordinator, CoordinatorSetting {
    
    func start() {
        let viewModel = TodoMainViewModel()
        let viewController = TodoViewController(viewModel: viewModel)
        
        viewModel.coordinator = self
        
        presenter?.isNavigationBarHidden = false
        presenter?.pushViewController(viewController, animated: true)
    }
}

extension TodoMainCoordinator: TodoMainViewCoordinatorDelegate {
    func showDetail(item: TodoModel) {
        let viewModel = TodoDetailViewModel()
        let viewController = TodoDetailViewController(viewModel: viewModel)
        
        presenter?.isNavigationBarHidden = false
        presenter?.pushViewController(viewController, animated: true)
    }
}
