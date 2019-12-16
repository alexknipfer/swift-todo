//
//  TodoItem.swift
//  CoreDataTodo
//
//  Created by Alexander Knipfer on 12/15/19.
//  Copyright © 2019 Alexander Knipfer. All rights reserved.
//

import Foundation
import CoreData

public class TodoItem: NSManagedObject, Identifiable {
    @NSManaged public var createdAt: Date?
    @NSManaged public var title: String?
}

extension TodoItem {
    static func getAllTodoItems() -> NSFetchRequest<TodoItem> {
        let request: NSFetchRequest<TodoItem> = NSFetchRequest<TodoItem>(entityName: "TodoItem")
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
