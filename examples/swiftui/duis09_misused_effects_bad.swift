import SwiftUI

/// DUIS-09 – MISUSED EFFECTS
///
/// 1) Uses onChange to update a "double" state that could be derived
///    directly from `value` in the body.
/// 2) Uses onAppear for work that may run multiple times and is not
///    obviously tied to the actual lifecycle needs.

struct MisusedEffectsExampleView: View {
    @State private var value: Int = 0
    @State private var double: Int = 0
    @State private var appearCount: Int = 0

    var body: some View {
        VStack(spacing: 12) {
            Text("Misused Effects Example")
                .font(.headline)

            Text("Value: \(value)")
            Text("Double (stored via effect): \(double)")
            Text("onAppear count: \(appearCount)")
                .font(.caption)
                .foregroundColor(.secondary)

            Button("Increment") {
                value += 1
            }
        }
        .padding()
        // ❌ Unnecessary derived state stored via onChange
        .onChange(of: value) { newValue in
            double = newValue * 2
            print("Effect ran to recompute double = \(double)")
        }
        // ❌ onAppear used for side effects that might run multiple times
        .onAppear {
            appearCount += 1
            print("View appeared (count = \(appearCount))")
        }
    }
}
