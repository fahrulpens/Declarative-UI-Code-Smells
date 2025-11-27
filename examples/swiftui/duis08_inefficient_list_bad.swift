import SwiftUI

/// DUIS-08 – INEFFICIENT LIST
///
/// Renders thousands of rows inside a ScrollView + VStack (eager),
/// instead of using SwiftUI's List / LazyVStack for lazy rendering.

struct InefficientListExampleView: View {
    let items = (0..<5000).map { "Item \($0)" }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Inefficient List Example")
                .font(.headline)

            ScrollView {
                VStack(alignment: .leading, spacing: 4) {
                    // All views created up front
                    ForEach(items, id: \.self) { item in
                        Text(item)
                    }
                }
            }
            .frame(height: 300)
            .border(Color.gray.opacity(0.4))
        }
        .padding()
    }
}
