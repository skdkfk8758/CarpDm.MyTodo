//
//  UIViewControllerExtension.swift
//  CarpDmTodo
//
//  Created by 김동현 on 2018. 6. 17..
//  Copyright © 2018년 CarpDm. All rights reserved.
//

import Foundation
import RxSwift

protocol UIViewControllerExtension {
    
    var disposeBag: DisposeBag { get }
    
    func initUI()
    func initData()
    func initAction()
}
