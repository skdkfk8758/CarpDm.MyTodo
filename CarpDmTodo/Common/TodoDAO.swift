//
//  RealmConnection.swift
//  CarpDmTodo
//
//  Created by 김동현 on 2018. 6. 22..
//  Copyright © 2018년 CarpDm. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

class TodoDAO {
    
    let realm: Realm!
    
    static let shared = TodoDAO()
    private init() { try! realm = Realm() }
    
    func selectAll() -> Observable<[TodoModel]> {
        return Observable.just(realm.objects(TodoModel.self).toArray(ofType: TodoModel.self))
    }
    
    func insert(item: TodoModel) {
        try! realm.write { realm.add(item) }
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        return flatMap { $0 as? T }
    }
}
