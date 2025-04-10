import SwiftUI

struct InfoView: View {
    @Binding var title: String
    @Binding var color: Color

    let colorOptions: [Color] = [.yellow, .green, .red, .blue]

    var body: some View {
            Section("Choose Color") {
                Picker("Theme Color", selection: $color) {
                    Text("Yellow").tag(Color.yellow)
                    Text("Green").tag(Color.green)
                    Text("Red").tag(Color.red)
                    Text("Blue").tag(Color.blue)
                }
            }
        }
    }


