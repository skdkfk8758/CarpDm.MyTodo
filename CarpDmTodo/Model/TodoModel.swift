//
//  TodoModel.swift
//  CarpDmTodo
//
//  Created by 김동현 on 2018. 6. 17..
//  Copyright © 2018년 CarpDm. All rights reserved.
//

import Foundation
import RealmSwift

class TodoModel: Object {
    @objc dynamic var subject = ""
    @objc dynamic var contents = ""
}
