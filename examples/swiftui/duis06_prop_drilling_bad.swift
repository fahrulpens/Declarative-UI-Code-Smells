import SwiftUI

/// DUIS-06 – PROP DRILLING
///
/// A theme color is passed through multiple intermediate views that do not
/// use it themselves, only to reach a deeply nested view.

struct PropDrillingRootView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("Prop Drilling Example")
                .font(.headline)
            LevelOneView(themeColor: .blue)
        }
        .padding()
    }
}

struct LevelOneView: View {
    let themeColor: Color

    var body: some View {
        // Does not use themeColor, just forwards
        LevelTwoView(themeColor: themeColor)
    }
}

struct LevelTwoView: View {
    let themeColor: Color

    var body: some View {
        // Still just forwards
        LevelThreeView(themeColor: themeColor)
    }
}

struct LevelThreeView: View {
    let themeColor: Color

    var body: some View {
        Text("Deep child using themeColor")
            .foregroundColor(themeColor)
            .padding()
            .border(themeColor)
    }
}
