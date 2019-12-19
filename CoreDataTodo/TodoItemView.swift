//
//  TodoItemView.swift
//  CoreDataTodo
//
//  Created by Alexander Knipfer on 12/18/19.
//  Copyright © 2019 Alexander Knipfer. All rights reserved.
//

import SwiftUI

struct TodoItemView: View {
    var title: String = ""
    var createdAt: String = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title).font(.headline)
                Text(createdAt).font(.caption)
            }
        }
    }
}

struct TodoItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemView()
    }
}
