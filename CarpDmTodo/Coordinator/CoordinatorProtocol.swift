//
//  CoordinatorProtocol.swift
//  CarpDmTodo
//
//  Created by 김동현 on 2018. 6. 17..
//  Copyright © 2018년 CarpDm. All rights reserved.
//

import Foundation
import UIKit.UINavigationController

enum PresentType {
    case push
    case popover
    case madal
}

protocol CoordinatorSetting {
    func start()
}

class Coordinator {
    
    var childCoordinator: [Coordinator] = []
    var presenter: UINavigationController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
}
