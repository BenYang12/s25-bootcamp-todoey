import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var item: String
    var isDone: Bool
}

struct ContentView: View {
    @State private var todos: [Todo] = [Todo(item: "Finish Project 4", isDone: false), Todo(item: "Watch UNC beat Duke", isDone: false)]

    @State private var title: String = "Todo"
    @State private var color: Color = .black
    @State private var showInfo: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack{
                HStack {
                    Text("4:58")
                    Spacer()
                    Image("topright")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)//code copied from previous project
                }
            }
            HStack {
                TextField("Title", text: $title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(color)
                Spacer()
                Button {
                    showInfo = true
                } label: {
                    Image(systemName: "info.square")
                        .foregroundColor(color)
                        .font(.largeTitle)
                }
            }
            .sheet(isPresented: $showInfo) {
                InfoView(title: $title, color: $color)
            }
            List {
                ForEach($todos) { $todo in
                    TodoRowView(todo: $todo, color: color)
                }
                

                Button{
                    todos.append(Todo(item: "", isDone: false))
                } label: {
                    Text("Add Reminder")
                        .foregroundColor(color)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

