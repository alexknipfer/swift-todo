//
//  ContentView.swift
//  CoreDataTodo
//
//  Created by Alexander Knipfer on 12/15/19.
//  Copyright © 2019 Alexander Knipfer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: TodoItem.getAllTodoItems()) var todoItems: FetchedResults<TodoItem>
    
    @State private var newTodoItem = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("What's next?")) {
                    HStack {
                        TextField("New item", text: self.$newTodoItem)
                        Button(action: {
                            let todoItem = TodoItem(context: self.managedObjectContext)
                            todoItem.title = self.newTodoItem
                            todoItem.createdAt = Date()
                            
                            do {
                                try self.managedObjectContext.save()
                            } catch {
                                print(error)
                            }
                            
                            self.newTodoItem = ""
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("My current todos")) {
                    ForEach(self.todoItems, id: \.self) { todoItem in
                        TodoItemView(title: todoItem.title!, createdAt: "\(todoItem.createdAt!)")
                    }
                }
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
