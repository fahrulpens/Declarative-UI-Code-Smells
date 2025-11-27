import SwiftUI

/// DUIS-02 – NESTED VIEW
///
/// Deeply nested stacks just to display a simple text.
/// The structure is much more complex than needed.

struct NestedViewExampleView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    ZStack {
                        HStack {
                            VStack {
                                ZStack {
                                    HStack {
                                        VStack {
                                            Text("Deeply nested SwiftUI view")
                                                .padding()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
