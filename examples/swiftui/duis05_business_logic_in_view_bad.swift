import SwiftUI

/// DUIS-05 – BUSINESS LOGIC IN VIEW
///
/// The view:
///  - Implements "eligibility" domain rules,
///  - Simulates an API call,
///  - Orchestrates everything inside the SwiftUI view instead of
///    delegating to a separate view model / use-case.

struct BusinessLogicInViewExampleView: View {
    @State private var age: String = ""
    @State private var eligible: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Business Logic in View (Bad)")
                .font(.headline)

            TextField("Age", text: $age)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

            Text(eligible ? "Eligible" : "Not eligible")
                .font(.title3)

            Spacer()
        }
        .padding()
        .onChange(of: age) { newValue in
            guard let value = Int(newValue) else {
                eligible = false
                return
            }

            // Simulated "API call"
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                // Domain rule embedded in the view
                let result = (18...65).contains(value)
                DispatchQueue.main.async {
                    eligible = result
                }
            }
        }
    }
}
