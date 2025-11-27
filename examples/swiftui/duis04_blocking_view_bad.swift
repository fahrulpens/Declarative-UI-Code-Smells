import SwiftUI

/// DUIS-04 – BLOCKING VIEW
///
/// Heavy synchronous computation is done as a computed property used
/// directly in body, so it may execute on every render and block the UI.

struct BlockingViewExampleView: View {
    // Heavy computed property
    var squares: [Int] {
        (0..<100_000).map { $0 * $0 }
    }

    var body: some View {
        VStack {
            Text("Blocking View Example")
                .font(.headline)
            Text("This may stutter on low-end devices.")
                .font(.caption)
                .foregroundColor(.secondary)

            List(squares.prefix(200), id: \.self) { n in
                Text("\(n)")
            }
        }
        .padding()
    }
}
