//
//  AppCoordinator.swift
//  CarpDmTodo
//
//  Created by 김동현 on 2018. 6. 17..
//  Copyright © 2018년 CarpDm. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator, CoordinatorSetting {
    
    func start() {
        let coordinator = TodoMainCoordinator(presenter: presenter!)
    
        coordinator.start()
        childCoordinator.append(coordinator)
    }
}
