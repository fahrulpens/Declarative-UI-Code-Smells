import SwiftUI

/// DUIS-03 – MUTABLE VIEW
///
/// The view receives an external model (ItemsModel) holding a list of items
/// and directly mutates it (add/remove) inside the view. In this example,
/// ItemsModel is acting more like a domain model than a specific ViewModel,
/// so the SwiftUI view is effectively mutating external/domain state.

class ItemsModel: ObservableObject {
    @Published var items: [String] = ["Item 1", "Item 2"]
}

struct MutableViewDemoParentView: View {
    @StateObject private var model = ItemsModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Mutable View Demo (Bad)")
                .font(.headline)
            MutableViewBadChildView(model: model)
            Text("Parent still sees items as: \(model.items.description)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct MutableViewBadChildView: View {
    @ObservedObject var model: ItemsModel

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Button("Add item") {
                    // ❌ Smell: directly mutating external model's data
                    model.items.append("Item \(model.items.count + 1)")
                }
                Button("Remove last") {
                    if !model.items.isEmpty {
                        model.items.removeLast() // ❌ again mutating external shared state
                    }
                }
            }

            List(model.items, id: \.self) { item in
                Text(item)
            }
        }
        .padding()
        .background(Color(white: 0.95))
        .cornerRadius(8)
    }
}
