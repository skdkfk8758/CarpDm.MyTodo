//
//  UINavigationItemExtension.swift
//  CarpDmTodo
//
//  Created by 김동현 on 2018. 6. 20..
//  Copyright © 2018년 CarpDm. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    func insertButton() -> UIBarButtonItem {
        var barButton = UIBarButtonItem()
        barButton.title = "추가"
        
        return barButton
    }
    
    func removeAllButton() -> UIBarButtonItem {
        var barButton = UIBarButtonItem()
        barButton.title = "전체삭제"
        
        return barButton
    }
}
