import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var item: String
    var isDone: Bool
}

struct ContentView: View {
    @State private var todos: [Todo] = [
        Todo(item: "Finish Project 3", isDone: false),
        Todo(item: "Watch UNC beat Duke", isDone: false)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("4:58")
                Spacer()
                Image("topright")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)//code copied from previous project
            }

            List {
                ForEach($todos) { $todo in
                    HStack {
                        Button {
                            todo.isDone.toggle()//actionthen label
                        } label: {
                            Image(systemName: todo.isDone ? "checkmark.square.fill" : "square")
                                .foregroundColor(todo.isDone ? .green : .gray)
                        }

                        TextField("New Todo", text: $todo.item)
                            .strikethrough(todo.isDone)
                    }
                }

                Button {
                    todos.append(Todo(item: "", isDone: false))//add a empty task to the list
                } label: {
                    Text("New Reminder")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

