import SwiftUI

/// DUIS-01 – LARGE COMPONENT
///
/// One view handles:
///  - layout
///  - navigation (tabs)
///  - data fetching
///  - filtering
///  - simple statistics
///  - all UI rendering
///
/// This is a "God View" / Large Component smell.

struct LargeComponentDashboardView: View {
    @State private var tab: String = "home"
    @State private var name: String = ""
    @State private var items: [Int] = []
    @State private var filter: String = ""
    @State private var loading: Bool = false
    @State private var error: String? = nil

    var body: some View {
        HStack(spacing: 0) {
            // Sidebar
            VStack(alignment: .leading, spacing: 16) {
                Text("Dashboard")
                    .font(.title)
                Text("User: \(name.isEmpty ? "(anonymous)" : name)")
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)

                Text("Tabs")
                    .font(.headline)
                HStack {
                    Button("Home") { tab = "home" }
                    Button("Stats") { tab = "stats" }
                    Button("Settings") { tab = "settings" }
                }

                Spacer()
            }
            .frame(width: 220)
            .padding()
            .background(Color(white: 0.95))

            Divider()

            // Main content – everything in one big view
            VStack(alignment: .leading, spacing: 16) {
                if tab == "home" {
                    Text("Items")
                        .font(.title2)
                    TextField("Filter", text: $filter)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 300)

                    if loading {
                        ProgressView("Loading...")
                    } else if let error = error {
                        Text(error)
                            .foregroundColor(.red)
                    } else {
                        List(filteredItems, id: \.self) { item in
                            Text("Item \(item)")
                        }
                    }
                } else if tab == "stats" {
                    Text("Statistics")
                        .font(.title2)
                    Text("Item count: \(items.count)")
                    Text("Sum: \(items.reduce(0, +))")
                } else if tab == "settings" {
                    Text("Settings")
                        .font(.title2)
                    Text("Imagine a long list of settings here...")
                }

                Spacer()
            }
            .padding()
        }
        .onAppear {
            loadItems()
        }
    }

    private var filteredItems: [Int] {
        if filter.isEmpty { return items }
        return items.filter { "\($0)".contains(filter) }
    }

    // Data fetching + business-ish logic all here
    private func loadItems() {
        loading = true
        error = nil
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            let data = Array(0..<50)
            DispatchQueue.main.async {
                self.items = data
                self.loading = false
            }
        }
    }
}
