//
//  TodoRowView.swift
//  Todoey
//
//  Created by Benjamin Yang on 4/8/25.
//

import SwiftUI
struct TodoRowView: View {
    @Binding var todo: Todo
    var color: Color

    var body: some View {
        HStack {
            Button {
                todo.isDone.toggle()
            } label: {
                Image(systemName: todo.isDone ? "checkmark.square.fill": "square")
                    .foregroundColor(todo.isDone ? .green : .gray)
            }

            TextField("New Todo", text: $todo.item)
                .strikethrough(todo.isDone)
                .foregroundColor(color)//makes my notes colored
        }
    }
}

