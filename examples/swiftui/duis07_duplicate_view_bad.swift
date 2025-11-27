import SwiftUI

/// DUIS-07 – DUPLICATE VIEW
///
/// Three user "cards" with nearly identical view structure are copy–pasted
/// instead of extracting a reusable UserCard view.

struct DuplicateViewExampleView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Duplicate View Example")
                .font(.headline)

            // Card #1
            VStack(alignment: .leading) {
                Text("Alice").bold()
                Text("alice@example.com")
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(white: 0.95))
            .cornerRadius(8)

            // Card #2 – copy-pasted layout
            VStack(alignment: .leading) {
                Text("Bob").bold()
                Text("bob@example.com")
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(white: 0.95))
            .cornerRadius(8)

            // Card #3 – copy-pasted again
            VStack(alignment: .leading) {
                Text("Charlie").bold()
                Text("charlie@example.com")
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(Color(white: 0.95))
            .cornerRadius(8)

            Spacer()
        }
        .padding()
    }
}
